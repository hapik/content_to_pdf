# content_to_pdf
Summary: This is a simple solution for reading website content in custom formated PDF

# Short story of making it
Posts, articules and website content is formated by creators in various ways. Some of the formating was hard to read for me. At the begining I was copying content of a website and paste it into text editor.
Next step was to format it in text editor for better reading.
Then I figured out that I should generate PDF file, which suits good for me.
And _the last step was have custom made PDF file of highlanded content with two clicks of mouse_.

# Tools used
- RunWith - Firefox/Iceweasel extention to start script from context menu
- xclip - for content to text file export
- pandoc - for text file to ODT convertion with custom made template
- unoconv (libreoffice needed) - for ODT to PDF convertion (can be done directly in pandoc, however I prefere this solution due to massive pandoc-tex package)
- evince - for PDF reading

# How to use it
1. Install Firefox/Iceweasel extension [RunWith](http://siliconkit.com/RunWith/) and set up program to run (read.sh script)
2. Download read.sh file and store it where you like (should have +x rights)
3. Right mouse button for contex menu and left mouse button for starting RunWith extension
4. You have nice PDF file on you screen

# Script explanation

    #!/bin/bash
    
    # path to documents
    path=/home/_userid_/Documents
    
    # clipboard to file
    xclip -out > $path/read.txt
    
    # pandoc conversion using read_formating.odt file (I use 11 point Gentium fonts, three columns for reading on 27 inch screen, small margins)
    pandoc $path/read.txt --reference-odt=$path/read_formating.odt -o $path/read.odt
    
    # conversion ODT to PDF using LibreOffice
    unoconv $path/read.odt -o $path/read.pdf
    
    # removing some temporary files
    rm $path/read.odt
    rm $path/read.txt
    
    # opening PDF file in presentation mode
    evince -s $path/read.pdf
    exit
