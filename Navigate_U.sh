#!/usr/bin/env python3
"""
Program
--------
Navigate.py (9 May 2023) \n

Description
------------
Show the standardized File System Structure (FSS) of a project in a html file to allow easy navigation.
This software is to be used as part of ENCORE, the approach to improve the reproducibility of
computational projects. \n

Authors
-------
Antoine van Kampen, Aldo Jongejan, Utkarsh Mahamune \n
Bioinformatics Laboratory, Amsterdam UMC, the Netherlands \n
https://www.bioinformaticslaboratory.eu \n

Function call
-------------
create_navigate(.....) \n

Command line
------------
Navigate.py -h \n
"""

import os
import sys
import markdown            # conversion markdown to html
import shutil              # copying files
import configparser        # to read/parse configuration file
from html import escape
import datetime
import random
import string
import re                  # regular expressions


########################
# FUNCTION DEFINITION
########################

def create_directory_structure(itempath, fsspath, navdir, showall,
                               filetypes, filesexclude,
                               filesinclude, filetypesexclude,
                               direxclude, fileshelp):
    """This function takes arguments to include/exclude files, filetypes, and subdirectories.
    Note: 'filetypes' determines the filetypes to be included. This would make 'filetypesexclude' unnecessary.
    However, here we have the situation that we would like to include .txt files but to exclude '\*-template.txt'
    files, which can now be specified in the filetypesexclude argument.
    Alternatively, we could have listed all the individual template files in the filesexclude tuple.

    Parameters
    -----------
    itempath: str
       Intially location of FSS (FSSPath) but is updated during the recursion of this function
    fsspath: str
       Location of standardized fle system structure (FSS). This path should point to the
       root of the FSS. Preferably, this is a relative path. The default of this path is ".".
    navdir: str
       Location of navigation directory (.navigate)
    showall: int
       if showall = 1 then show all subdirectories and all files includes/excludes are neglected
    filetypes: str
       filetypes to include in the directory tree
    filesexclude: str
        files to exclude from the directory tree
    filesinclude: str
       files to include in the directory tree
    filetypesexclude: str
       file types to exclude from the directory tree
    direxclude: str
       directories to exclude from the directory tree
    fileshelp: str
       help files to exclude from the directory tree

    RETURNS
    -------
    str
      Directory hierarchy of the standardized file system structure (FSS) with hyperlinked files
 """

    directories = []
    files = []

    if showall != 1:  # Show complete directory structure (1) or not (<>1)
        showall = 0

    # Get all subdirectories and files (using the includes and excludes)
    for item in os.listdir(itempath):
        item_path = os.path.join(itempath, item)
        if os.path.isdir(item_path) and (item not in direxclude):
            directories.append(item)
        elif showall == 1:  # Show all files
            files.append(item)
        elif (item.endswith(filetypes) and
                (item not in filesexclude) and
                (item not in fileshelp) and
                (not item.endswith(filetypesexclude))):
            files.append(item)
        elif item in filesinclude:
            files.append(item)

    # Sort in alphabetical order
    directories.sort()
    files.sort()

    # Convert directory structure/files to tree (html format)
    content = ""
    for item in directories:
        item_path = os.path.join(itempath, item)
        content  += f"<details><summary><strong>{escape(item)}</strong></summary></li>"
        content  += "<ul>"
        content  += create_directory_structure(item_path, fsspath, navdir,
                                               showall, filetypes,
                                               filesexclude, filesinclude,
                                               filetypesexclude, direxclude, fileshelp)
        content += "</ul>"
        content += "</details>"

    # Note: the html output will be shown in Navigation.html, which is a predefined HTML file
    # containing 4 iframes. The tree is shown in the upper left corner. The content of the
    # files are shown in 'frame-2'  (upper right corner).
    for item in files:
        item_path = os.path.join(itempath, item)
        if item.endswith((".png", ".jpg", ".jpeg", ".svg", ".gif")):  # images should be open in separate
                                                                        # tab/window because these are not
                                                                        # scaled properly in the iframe
            content += f"<li><a target=\"_blank\" href=\"..\{escape(item_path)}\">{escape(item)}</a></li>"
            # next line tried to open image in new window, but doesn't work (in Chrome)
            # content += f"<a href=\"javascript:window.open('{item_path}', 'newwindow',
            # 'width=300,height=250')\">{escape(item)}</a>"
        elif item.endswith(".md"):  # Markdown files should be parsed to html to facilitate visualization
                                    # The html file is written to .navigate in the root of the FSS
                                    # Subsequently, the href link should point to the html file
            new_item_path = md2html(navdir, item_path, item)  # points to html in .navigate
            content += f"<li><a href=\"..\{escape(new_item_path)}\" target=\"frame-2\">{escape(item)}</a></li>"
        else:
            content += f"<li><a href=\"..\{escape(item_path)}\" target=\"frame-2\">{escape(item)}</a></li>"
    return content
# END OF FUNCTION create_directory_structure


def clean_navigate(fsspath, navdir):
    """This function removes all files except navigate-template.html from the .navigate directory prior to
    making a new Navigation.html.

    :param str fsspath:
        Location of standardized fle system structure (FSS). This path should point to the root
        of the FSS. Preferably, this is a relative path. The default of this path is "." .
    :param str navdir:
        location of the .navigate directory
    """
    retain = ["__navigate-template.html__", "0_README.md"]  # don't delete these files

    # Loop through all files
    for item in os.listdir(os.path.join(fsspath, navdir)):
        if item not in retain:                              # If it isn't in the list for retaining
            os.remove(os.path.join(fsspath, navdir, item))  # Remove the item
# END OF FUNCTION clear_navigate


def get_random_string(length):
    """Generate random string from lower-case letters

    :param int length: Length of string
    :return: random string of specified length
    """
    letters = string.ascii_lowercase  # choose from all lowercase letter
    rstr = ''.join(random.choice(letters) for i in range(length))
    return rstr
# END OF FUNCTION get_random_string


def md2html(navdir, itempath, item):
    """Convert markdown file (.md) to html (.html) file

    :param str navdir:  location of .navigate directory
    :param str itempath: location of markdown file
    :param str item: markdown file to be converted
    :return: Link to html file in .navigate
    """
    with open(itempath, "r") as f:
        md = f.read()             # read complete markdown file
    html = markdown.markdown(md)  # convert to html

    # The resulting html file (project) will be saved in .navigate in the root
    # of the FSS. Therefore, all paths presents in this file should be changed to
    # be relative to the root again
    html = html.replace('href=\".', 'target = "frame-2" href=\".\..')
    html = html.replace('src=\".', 'target = "frame-2" src=\".\..')

    # All converted markdown files will be written to navdir. To avoid files will be overwritten
    # a random string is attached to the file name and the extension of the file is changed from
    # md to html.
    rstr = get_random_string(10)

    item = item.rsplit('.', 1)[0] + "_" + rstr + '.html'  # replace file extension md --> html
    new_itempath = os.path.join(navdir, item)

    with open(new_itempath, "w") as f:
        f.write(html)

    return new_itempath
# END OF FUNCTION md2html


def parse_project(fsspath, filename):
    """Function to parse the Project file (0_PROJECT.md) and convert to HTML. This file contains
    the general project information and should be displayed together with the project organization
    (i.e., the FSS). The converted markdown file is also saved as a html file in .navigate to be displayed
    in the project navigation window.

    The Project file is should be located in the root of the FSS

    Parameters
    ----------
    fsspath : str
        Location of standardized fle system structure (FSS). This path should point to the
        root of the FSS. Preferably, this is a relative path. The default of this path is ".".
    filename : str
        file name of markdown file

    Returns
    -------
    str
        html version of the project description

    """
    with open(os.path.join(fsspath, filename), "r") as f:
        markdown_text = f.read()                # read complete markdown file
    project = markdown.markdown(markdown_text)  # convert to html

    # The resulting html file (project) will be saved in .navigate in the root
    # of the FSS. Therefore, all paths presents in this file should be changed to
    # be relative to the root again
    project = project.replace('href=\".', 'target = "frame-2" href=\".\..')
    project = project.replace('src=\".', 'target = "frame-2" src=\".\..')

    return project
# END OF FUNCTION parse_project


def save_project(fsspath, project, line, title, navdir):
    """Format and save Project file (e.g., 0_PROJECT.md) as html file in .navigate.

    Parameters
    ----------
    fsspath: str
        Location of standardized fle system structure (FSS). This path should point to the
        root of the FSS. Preferably, this is a relative path. The default of this path is ".".
    project: str
        html version of Project file (e.g., 0_PROJECT.md)
    line : str
        formatted html line
    title : str
        Section title
    navdir : str
        location of .navigate directory

    Returns
    -------
    bool
        Always returns True
   """
    with open(os.path.join(fsspath, navdir, "0_project.html"), "w") as f:
        f.write(line)
        f.write(title)
        f.write(line)
        f.write(project)     # write converted markdown file to html file
        f.write(line)
    return True
# END OF FUNCTION save_project


def save_getting_started(fsspath, line, title, navdir, filename="0_GETTINGSTARTED.html"):
    """Format and save the html file that serves as a starting point for researchers who aim to reproduce the
    project. It will show the most important results together with the data and/or code that was used to
    produce it.

    :param str fsspath:
        Location of standardized fle system structure (FSS). This path should point to the
        root of the FSS. Preferably, this is a relative path. The default of this path is ".".
    :param str line:
        Formatted html line
    :param str title:
        Section title
    :param str navdir:
        Location of .navigate
    :param str filename:
        Html file contain most important aspects of project. The default filename is '0_GETTING_STARTED.html'.
        This file should be located in the root of the FSS. This document can be prepared with any text editor
        (e.g., Microsoft Word, LaTex), and subsequently converted to html. The document should contain
        relative hyperlinks to the relevant subdirectories and/or files (e.g., ./ProjectDocumentation
        or ./Processing/README.md).
    """

    with open(os.path.join(fsspath, filename), "r") as f:
        try:
            start = f.read()   # read html file
        except Exception:
            print("Error!")
            print(f"Make sure that you used utf-8 encoding for {filename}")
            sys.exit(1)

    # Format and save
    #
    # The resulting html file (start) will be saved in .navigate in the root
    # of the FSS. Therefore, all paths presents in this file should be changed to
    # be relative to the root again

    # Get all references to markdown files
    a = re.findall(r'href=\"(.*\.md)\"', start)

    for item in a:
        item_backup    = item
        item           = item.replace('%20', ' ')  # otherwise file wil not open in md2thml
        mdpath, mdfile = os.path.split(item)
        new_mdpath     = md2html(navdir, item, mdfile)  # do the conversion
        start          = start.replace(item_backup, new_mdpath)

    # Change all paths relative to the root of the FSS
    start = start.replace('href=\"', 'target=\"frame-2\" href=\".\..\\')
    start = start.replace('src=\"',  'target=\"frame-2\" src=\".\..\\')
    start = start.replace('img=\"',  'target=\"frame-2\" img=\".\..\\')
    with open(os.path.join(fsspath, navdir, "0_gettingstarted.html"), "w") as f:
        f.write(line)
        f.write(title)
        f.write(line)
        f.write(start)
        f.write(line)
# END OF FUNCTION save_getting_started


def parse_repo(fsspath, filename="github.txt"):
    """Function to get the name of the GitHub repository corresponding to the project.
    From github.txt in /Processing
    The repository is identified by looking for the last line in this file that\n
        -ends with .git\n
        -starts with http\n
        -starts with github.com\n

    :param str fsspath: Location of standardized fle system structure (FSS). This path should point to the
        root of the FSS. Preferably, this is a relative path. The default of this path is ".".
    :param str filename: name of file containing name of GitHub repository
    :return: name of GitHub repository
    """
    repo = "No GitHub repository found"  # default response if repository is not specified or cannot be found
    f = open(os.path.join(fsspath, "Processing", filename), "r")
    myline = f.readline()
    while myline:
        myline = myline.rstrip()  # remove trailing spaces
        if myline.endswith('.git') or \
                myline.startswith('http') or \
                myline.startswith('github.com'):
            repo = myline
        myline = f.readline()
    return repo
# END OF FUNCTION parse_repo


def read_config(confdir, fsspath, filename="Navigation.conf"):
    """Function to read and parse the configuration file

    :param str confdir:
        Location of configuration file
    :param str fsspath:
        Location of standardized fle system structure (FSS). This path should point to the
        root of the FSS. Preferably, this is a relative path. The default of this path is ".".
    :param str filename:
        Name of configuration file
    :return: configuration settings
    """
    config = configparser.ConfigParser()
    config.read(os.path.join(fsspath, confdir, filename))
    return config
# END OF FUNCTION read_config


def s2t(string):
    """This function splits a string (obtained from read_config) and converts in to a tuple
    using the comma as a delimiter

    :param str string: input string
    :return: tuple containing the separate parts of the string
    """
    if string.find(',') != -1:  # if string is not a single entry
        # split the string using comma as a delimiter, and convert to tuple
        string = tuple(map(lambda s: s.strip(), string.split(',')))
    return string
# END OF FUNCTION st2


def write_navigation(fsspath, repo, project, projecttitle,
                     gettingstarted, directory_structure,
                     navdir, navigatedir):
    """Write Navigation.html

    :param str fsspath: Location of standardized fle system structure (FSS). This path should point to the
        root of the FSS. Preferably, this is a relative path. The default of this path is ".".
    :param str repo: location of GitHub repository
    :param str project: general project information
    :param str projecttitle: title of project
    :param str gettingstarted: information to get the user of the project started with the FSS
    :param str directory_structure: structure of FSS and all files in the FSS
    :param str navdir: location of .navigate directory
    :param str navigatedir: location of output file (Navigate.html)
    """
    fss = f"<ul>{directory_structure}</ul>"

    today = datetime.datetime.now()  # Get date and time

    # html stuff
    startHTML  = "<html>"
    startHEAD  = "<head>"
    # htmltitle  = "Navigation for the standardized file structure (FSS)"
    # htmlscript = "<script type=\"module\" src=\"https://md-block.verou.me/md-block.js\"></script>"
    startSTYLE = "<style>"
    linestyle  = "hr.rounded {border-top: 4px solid #bbb; border-radius: 5px;}"  # rounded border
    endSTYLE   = "</style>"
    endHEAD    = "</head>"
    startBODY  = "<body>"
    endBODY    = "</body>"
    endHTML    = "</html>"

    line      = "<hr class='rounded'>"

    # text elements
    pagetitle    = "Project: "
    information  = "Project information"
    browser      = "Project browser"
    starting     = "Getting started"
    repo         = "<a href=" + repo + " target=\"_blank\">" + repo + "</a>"
    repo         = "Github repository: " + repo
    Instruction1 = 'Click triangle to unfold directory. Click on file to show contents.'
    Instruction2 = 'Note: only relevant files are shown in this browser'
    reset        = '[RESET]'

    # Parse the project name out of the Project file (e.g., (0_PROJECT.md)
    # Since it was converted from markdown to html, I remove the html tags
    # using re.search (regular expressions).
    # projectname = project.split('\n', 1)[0]                     # get the first line
    # projectname = re.search('</strong>(.*)</p>', projectname)
    # projectname = projectname.group(1)

    # format text elements
    pagetitle    = "<p style=\"color:green;font-size:25px;\"> <strong>" + pagetitle + projecttitle + "</strong> </p>"
    information  = "<p style=\"color:blue;font-size:20px;\"><strong>" + information + "</strong></p>"
    starting     = "<p style=\"color:blue;font-size:20px;\"><strong>" + starting + "</strong></p>"
    reset        = "<a style=\"color:red;font-size:16px;\" target=\"_top\" href=\".\\..\\Navigate.html\">" + \
                   reset + "</a>"
    browser      = "<p style=\"color:blue;font-size:20px;\"><strong>" + browser + " " + reset + "</strong></p>"
    DateTime     = "Generated on: " + today.strftime("%B %d, %Y (%H:%M:%S)")  # Textual month, day and year
    repo         = "<p style=\"color:black;font-size:16px;\">" + repo + "</p>"

    # Copy navigation template
    # The navigation template defines four iframes in which all content will be displayed
    src = os.path.join(fsspath, navdir, "__navigate-template.html__")
    dst = os.path.join(fsspath, navigatedir, "Navigate.html")
    shutil.copy(src, dst)

    # Copy 0_GETTINGSTARTED.pdf
    src = os.path.join(fsspath, "0_GETTINGSTARTED.html")
    dst = os.path.join(fsspath, navdir, "0_gettingstarted.html")
    shutil.copy(src, dst)

    # Format and save Project file (e.g., 0_PROJECT.md) as html file
    save_project(fsspath, project, line, information, navdir)

    # Format and save Project file that contains project highlights/summary
    save_getting_started(fsspath, line, starting, navdir, gettingstarted)

    #
    # Write html page and save to file
    #
    with open(os.path.join(fsspath, navdir, "fss.html"), "w") as f:
        f.write(startHTML)     # html stuff
        f.write(startHEAD)     # html stuff
        # f.write(htmlscript)  # html stuff
        # f.write(htmltitle)   # html stuff
        f.write(startSTYLE)    # html stuff
        f.write(linestyle)     # html stuff
        f.write(endSTYLE)      # html stuff
        f.write(endHEAD)       # html stuff
        f.write(startBODY)     # html stuff

        # Start the actual content
        f.write(line)          # html line
        f.write(pagetitle)     # Section title: Project Overview
        f.write(DateTime)      # Date of generation
        f.write(line)          # html line
        f.write(browser)       # Section title: Project browser
        f.write(line)          # html line
        f.write(repo)          # Name of github repository
        f.write(Instruction1)  # Line with instructions
        f.write(fss)           # FSS structure
        f.write(Instruction2)  # Line with instructions
        f.write(line)          # html line

        f.write(endBODY)       # html stuff
        f.write(endHTML)       # html stuff

# END OF FUNCTION write_navigation


def create_navigate(fsspath=".", navdir=".navigate", navigatedir="", confdir="", conffile="Navigation.conf"):
    """Main function to create Navigate.html. This html file can be opened in your web-browser to
    explore all the files in the project (i.e., the standardized File System Structure; FSS). Note
    that specific files and/or sub-directories may have been excluded from the navigation page. This
    can be configured in the Configuration file.

    :param str fsspath: Location of standardized fle system structure (FSS). This path should point to the root of the FSS. Preferably, this is a relative path. The default of this path is ".".
    :param str navdir: location of .navigate
    :param str navigatedir: location of output file (Navigation.html)
    :param str confdir: location of configuration file
    :param str conffile: name of configuration file
    """

    print("Creating Navigate.html.........")

    # remove all files (except template) from .navigate
    clean_navigate(fsspath, navdir)

    # Read and parse configuration file
    config = read_config(confdir, fsspath=fsspath, filename=conffile)

    projectTitle       = config['GENERAL']['ProjectTitle']

    showAll            = int(config['CONTENT']['ShowAll'])

    ProjectFile        = config['FILE.CONTENT']['ProjectFile']
    GettingStartedFile = config['FILE.CONTENT']['GettingStartedFile']

    # config returns a single string that may contain multiple entries. These
    # are split and stored in a tuple using the function s2t
    filesHelp          = s2t(config['FILES.INCLUDE.EXCLUDE']['filesHELP'])
    fileTypes          = s2t(config['FILES.INCLUDE.EXCLUDE']['fileTypes'])
    fileTypesExclude   = s2t(config['FILES.INCLUDE.EXCLUDE']['fileTypesExclude'])
    filesExclude       = s2t(config['FILES.INCLUDE.EXCLUDE']['filesExclude'])
    filesInclude       = s2t(config['FILES.INCLUDE.EXCLUDE']['filesInclude'])

    directoryExclude   = s2t(config['DIR.INCLUDE.EXCLUDE']['directoryExclude'])
    # end configuration

    # Parse Project file from markdown to html. This file will be printed in the bottom-left
    # frame of the predefined html page (Navigation.html) in the final output.
    Project = parse_project(fsspath, ProjectFile)

    # Get the name of the GitHub repository
    Repo = parse_repo(fsspath)

    # Generate the directory structure
    directory_structure = create_directory_structure(itempath=fsspath,
                                                     fsspath=fsspath,
                                                     navdir=navdir,
                                                     showall=showAll,
                                                     filetypes=fileTypes,
                                                     filesexclude=filesExclude,
                                                     filesinclude=filesInclude,
                                                     fileshelp=filesHelp,
                                                     filetypesexclude=fileTypesExclude,
                                                     direxclude=directoryExclude)

    write_navigation(fsspath, Repo, Project, projectTitle,
                     GettingStartedFile, directory_structure,
                     navdir, navigatedir)

    print("Navigate.html is now available at the specified location")
# END OF FUNCTION create_navigate


###############################################
# EXECUTE MAIN FUNCTION TO MAKE NAVIGATION.HTML
###############################################

# The next construct allows to directly execute the function from the command line or
# to import it as a module.

if __name__ == "__main__":
    from argparse import ArgumentParser, ArgumentDefaultsHelpFormatter

    # Parse command line arguments
    parser = ArgumentParser(formatter_class=ArgumentDefaultsHelpFormatter)
    parser.add_argument("-f", "--fsspath",     default=".",               help="Root of standardized FSS")
    parser.add_argument("-n", "--navdir",      default=".navigate",       help="Location of .navigate")
    parser.add_argument("-N", "--navigatedir", default="",                help="Location of output file (Navigate.html")
    parser.add_argument("-c", "--confdir",     default="",                help="Location of configuration file")
    parser.add_argument("-C", "--conffile",    default="Navigation.conf", help="Name of configuration file")

    # The next three arguments are added to prevent an error when running in JetBrains DataSpell/PyCharm
    parser.add_argument("--mode", default='client', help="Neglect. Only to enable execution from DataSpell/PyCharm")
    parser.add_argument("--host", default='127.0.0.1', help="Neglect. Only to enable execution from DataSpell/PyCharm")
    parser.add_argument("--port", default=52162, help="Neglect. Only to enable execution from DataSpell/PyCharm")

    args = vars(parser.parse_args())

    create_navigate(fsspath=args["fsspath"],
                    navdir=args["navdir"],
                    navigatedir=args["navigatedir"],
                    confdir=args["confdir"],
                    conffile=args["conffile"])

#%%
