=begin
------------------------------------------------------------ Class: RDoc
     We put rdoc stuff in the RDoc module to avoid namespace clutter.

     ToDo: This isn't universally true.


RDOC - RUBY DOCUMENTATION SYSTEM
================================
     This package contains Rdoc and SimpleMarkup. Rdoc is an application
     that produces documentation for one or more Ruby source files. We
     work similarly to JavaDoc, parsing the source, and extracting the
     definition for classes, modules, and methods (along with includes
     and requires). We associate with these optional documentation
     contained in the immediately preceding comment block, and then
     render the result using a pluggable output formatter. (Currently,
     HTML is the only supported format. Markup is a library that
     converts plain text into various output formats. The Markup library
     is used to interpret the comment blocks that Rdoc uses to document
     methods, classes, and so on.

     This library contains two packages, rdoc itself and a text markup
     library, 'markup'.


Roadmap
-------
     *   If you want to use Rdoc to create documentation for your Ruby
         source files, read on.

     *   If you want to include extensions written in C, see
         rdoc/parsers/parse_c.rb.

     *   For information on the various markups available in comment
         blocks, see markup/simple_markup.rb.

     *   If you want to drive Rdoc programatically, see RDoc::RDoc.

     *   If you want to use the library to format text blocks into HTML,
         have a look at SM::SimpleMarkup.

     *   If you want to try writing your own HTML output template, see
         RDoc::Page.


Summary
-------
     Once installed, you can create documentation using the 'rdoc'
     command (the command is 'rdoc.bat' under Windows)

       % rdoc [options]  [names...]

     Type "rdoc --help" for an up-to-date option summary.

     A typical use might be to generate documentation for a package of
     Ruby source (such as rdoc itself).

       % rdoc

     This command generates documentation for all the Ruby and C source
     files in and below the current directory. These will be stored in a
     documentation tree starting in the subdirectory 'doc'.

     You can make this slightly more useful for your readers by having
     the index page contain the documentation for the primary file. In
     our case, we could type

       % rdoc --main rdoc/rdoc.rb

     You'll find information on the various formatting tricks you can
     use in comment blocks in the documentation this generates.

     RDoc uses file extensions to determine how to process each file.
     File names ending +.rb+ and +.rbw+ are assumed to be Ruby source.
     Files ending +.c+ are parsed as C files. All other files are
     assumed to contain just SimpleMarkup-style markup (with or without
     leading '#' comment markers). If directory names are passed to
     RDoc, they are scanned recursively for C and Ruby source files
     only.


Credits
-------
     *   The Ruby parser in rdoc/parse.rb is based heavily on the
         outstanding work of Keiju ISHITSUKA of Nippon Rational Inc, who
         produced the Ruby parser for irb and the rtags package.

     *   Code to diagram classes and modules was written by Sergey A
         Yanovitsky (Jah) of Enticla.

     *   Charset patch from MoonWolf.

     *   Rich Kilmer wrote the kilmer.rb output template.

     *   Dan Brickley led the design of the RDF format.


License
-------
     RDoc is Copyright (c) 2001-2003 Dave Thomas, The Pragmatic
     Programmers. It is free software, and may be redistributed under
     the terms specified in the README file of the Ruby distribution.


USAGE
=====
     RDoc is invoked from the command line using:

        % rdoc <options> [name...]

     Files are parsed, and the information they contain collected,
     before any output is produced. This allows cross references between
     all files to be resolved. If a name is a directory, it is
     traversed. If no names are specified, all Ruby files in the current
     directory (and subdirectories) are processed.

     Options are:

<tt>--accessor</tt> <i>name[,name...]</i>specifies the name(s) of
                                         additional methods that should
                                         be treated as if they were
                                         +attr_+_xxx_ methods.
                                         Specifying "--accessor db_opt"
                                         means lines such as

          db_opt :name, :age

     will get parsed and displayed in the documentation. Each name may
     have an optional "=flagtext" appended, in which case the given
     flagtext will appear where (for example) the 'rw' appears for
     attr_accessor.

<tt>--all</tt>include protected and private methods in the output (by
              default only public methods are included)

<tt>--charset</tt> _charset_Set the character set for the generated
                            HTML.

<tt>--diagram</tt>include diagrams showing modules and classes. This is
                  currently an experimental feature, and may not be
                  supported by all output templates. You need dot V1.8.6
                  or later to use the --diagram option correctly
                  (http://www.research.att.com/sw/tools/graphviz/).

<tt>--exclude</tt> <i>pattern</i>exclude files and directories matching
                                 this pattern from processing

<tt>--extension</tt> <i>new=old</i>treat files ending _.new_ as if they
                                   ended _.old_. Saying '--extension
                                   cgi=rb' causes RDoc to treat .cgi
                                   files as Ruby source.

<tt>fileboxes</tt>Classes are put in boxes which represents files, where
                  these classes reside. Classes shared between more than
                  one file are shown with list of files that sharing
                  them. Silently discarded if --diagram is not given
                  Experimental.

<tt>--fmt</tt> _fmt_generate output in a particular format.

<tt>--help</tt>generate a usage summary.

<tt>--help-output</tt>explain the various output options.

<tt>--image-format</tt> <i>gif/png/jpg/jpeg</i>sets output image format
                                               for diagrams. Can be png,
                                               gif, jpeg, jpg. If this
                                               option is omitted, png is
                                               used. Requires --diagram.

<tt>--include</tt> <i>dir,...</i>specify one or more directories to be
                                 searched when satisfying :+include+:
                                 directives. Multiple +--include+
                                 options may be given. The directory
                                 containing the file currently being
                                 processed is always searched.

<tt>--inline-source</tt>By default, the source code of methods is shown
                        in a popup. With this option, it's displayed
                        inline.

<tt>line-numbers</tt>include line numbers in the source code

<tt>--main</tt> _name_the class of module _name_ will appear on the
                      index page. If you want to set a particular file
                      as a main page (a README, for example) simply
                      specifiy its name as the first on the command
                      line.

<tt>--merge</tt>when generating _ri_ output, if classes being processed
                already exist in the destination directory, merge in the
                current details rather than overwrite them.

<tt>--one-file</tt>place all the output into a single file

<tt>--op</tt> _dir_set the output directory to _dir_ (the default is the
                   directory "doc")

<tt>--op-name</tt> _name_set the name of the output. Has no effect for
                         HTML. "doc")

<tt>--opname</tt> _name_set the output name (has no effect for HTML).

<tt>--promiscuous</tt>If a module or class is defined in more than one
                      source file, and you click on a particular file's
                      name in the top navigation pane, RDoc will
                      normally only show you the inner classes and
                      modules of that class that are defined in the
                      particular file. Using this option makes it show
                      all classes and modules defined in the class,
                      regardless of the file they were defined in.

<tt>--quiet</tt>do not display progress messages

<tt>--ri</tt>, <tt>--ri-site</tt>, _and_ <tt>--ri-system</tt>generate
                                                             output than
                                                             can be read
                                                             by the _ri_
                                                             command-lin
                                                             e tool. By
                                                             default
                                                             --ri places
                                                             its output
                                                             in ~/.rdoc,
                                                             --ri-site
                                                             in
                                                             $datadir/ri
                                                             /<ver>/site
                                                             , and
                                                             --ri-system
                                                             in
                                                             $datadir/ri
                                                             /<ver>/syst
                                                             em. All can
                                                             be
                                                             overridden
                                                             with a
                                                             subsequent
                                                             --op
                                                             option. All
                                                             default
                                                             directories
                                                             are in ri's
                                                             default
                                                             search
                                                             path.

<tt>--show-hash</tt>A name of the form #name in a comment is a possible
                    hyperlink to an instance method name. When
                    displayed, the '#' is removed unless this option is
                    specified

<tt>--style</tt> <i>stylesheet url</i>specifies the URL of an external
                                      stylesheet to use (rather than
                                      generating one of our own)

<tt>tab-width</tt> _n_set the width of tab characters (default 8)

<tt>--template</tt> <i>name</i>specify an alternate template to use when
                               generating output (the default is
                               'standard'). This template should be in a
                               directory accessible via $: as
                               rdoc/generators/xxxx_template, where
                               'xxxx' depends on the output formatter.

<tt>--version</tt>display RDoc's version

<tt>--webcvs</tt> _url_Specify a URL for linking to a web frontend to
                       CVS. If the URL contains a '\%s', the name of the
                       current file will be substituted; if the URL
                       doesn't contain a '\%s', the filename will be
                       appended to it.


EXAMPLE
=======
     A typical small Ruby program commented using RDoc might be as
     follows. You can see the formatted result in EXAMPLE.rb and
     Anagram.

           :include: EXAMPLE.rb


MARKUP
======
     Comment blocks can be written fairly naturally, either using '#' on
     successive lines of the comment, or by including the comment in an
     =begin/=end block. If you use the latter form, the =begin line must
     be flagged with an RDoc tag:

       =begin rdoc
       Documentation to
       be processed by RDoc.
       =end

     Paragraphs are lines that share the left margin. Text indented past
     this margin are formatted verbatim.

     1.  Lists are typed as indented paragraphs with:

     *   a '*' or '-' (for bullet lists)

     *   a digit followed by a period for numbered lists

     *   an upper or lower case letter followed by a period for alpha
         lists.

     For example, the input that produced the above paragraph looked
     like

         1. Lists are typed as indented
            paragraphs with:
            * a '*' or '-' (for bullet lists)
            * a digit followed by a period for
              numbered lists
            * an upper or lower case letter followed
              by a period for alpha lists.

     2.  Labeled lists (sometimes called description lists) are typed
         using square brackets for the label.

        [cat]   small domestic animal
        [<tt>cat</tt>] command to copy standard input

     3.  Labeled lists may also be produced by putting a double colon
         after the label. This sets the result in tabular form, so the
         descriptions all line up. This was used to create the 'author'
         block at the bottom of this description.

        cat::   small domestic animal
        <tt>cat</tt>:: command to copy standard input

     For both kinds of labeled lists, if the body text starts on the
     same line as the label, then the start of that text determines the
     block indent for the rest of the body. The text may also start on
     the line following the label, indented from the start of the label.
     This is often preferable if the label is long. Both the following
     are valid labeled list entries:

        <tt>--output</tt> <em>name [, name]</em>::
            specify the name of one or more output files. If multiple
            files are present, the first is used as the index.
     
        <tt>--quiet:</tt>:: do not output the names, sizes, byte counts,
                            index areas, or bit ratios of units as
                            they are processed.

     4.  Headings are entered using equals signs

        = Level One Heading
        == Level Two Heading

     and so on

     5.  Rules (horizontal lines) are entered using three or more
         hyphens.

     6.  Non-verbatim text can be marked up:

     _italic_:     _word_ or _text_

     *bold*:       *word* or *text*

     +typewriter+: +word+ or +text+

     The first form only works around 'words', where a word is a
     sequence of upper and lower case letters and underscores. Putting a
     backslash before inline markup stops it being interpreted, which is
     how I created the table above:

       <em>italic</em>::     _word_ or <em>text</em>
       <b>bold</b>::       *word* or <b>text</b>
       <tt>typewriter</tt>:: +word+ or <tt>text</tt>

     7.  Names of classes, source files, and any method names containing
         an underscore or preceded by a hash character are automatically
         hyperlinked from comment text to their description.

     8.  Hyperlinks to the web starting http:, mailto:, ftp:, or www.
         are recognized. An HTTP url that references an external image
         file is converted into an inline <IMG..>. Hyperlinks starting
         'link:' are assumed to refer to local files whose path is
         relative to the --op directory.

     Hyperlinks can also be of the form +label+[url], in which case the
     label is used in the displayed text, and +url+ is used as the
     target. If +label+ contains multiple words, put it in braces:
     _{multi word label}[_url_]_.

     9.  Method parameter lists are extracted and displayed with the
         method description. If a method calls +yield+, then the
         parameters passed to yield will also be displayed:

        def fred
          ...
          yield line, address

     This will get documented as

        fred() { |line, address| ... }

     You can override this using a comment containing ':yields: ...'
     immediately after the method definition

        def fred      # :yields: index, position
          ...
          yield line, address

     which will get documented as

         fred() { |index, position| ... }

     10. ':yields:' is an example of a documentation modifier. These
         appear immediately after the start of the document element they
         are modifying. Other modifiers include

<tt>:nodoc:</tt><i>[all]</i>don't include this element in the
                            documentation. For classes and modules, the
                            methods, aliases, constants, and attributes
                            directly within the affected class or module
                            will also be omitted. By default, though,
                            modules and classes within that class of
                            module _will_ be documented. This is turned
                            off by adding the +all+ modifier.

          module SM  #:nodoc:
            class Input
            end
          end
          module Markup #:nodoc: all
            class Output
            end
          end

     In the above code, only class +SM::Input+ will be documented.

<tt>:doc:</tt>force a method or attribute to be documented even if it
              wouldn't otherwise be. Useful if, for example, you want to
              include documentation of a particular private method.

<tt>:notnew:</tt>only applicable to the +initialize+ instance method.
                 Normally RDoc assumes that the documentation and
                 parameters for #initialize are actually for the ::new
                 method, and so fakes out a ::new for the class. THe
                 :notnew: modifier stops this. Remember that #initialize
                 is protected, so you won't see the documentation unless
                 you use the -a command line option.

     11. RDoc stops processing comments if it finds a comment line
         containing '+#--+'. This can be used to separate external from
         internal comments, or to stop a comment being associated with a
         method, class, or module. Commenting can be turned back on with
         a line that starts '+#+++'.

         # Extract the age and calculate the
         # date-of-birth.
         #--
         # FIXME: fails if the birthday falls on
         # February 29th
         #++
         # The DOB is returned as a Time object.
     
         def get_dob(person)
            ...

     12. Comment blocks can contain other directives:

<tt>:section: title</tt>Starts a new section in the output. The title
                        following

       <tt>:section:</tt> is used as the section heading, and the
       remainder of the comment containing the section is used as
       introductory text. Subsequent methods, aliases, attributes,
       and classes will be documented in this section. A :section:
       comment block may have one or more lines before the :section:
       directive. These will be removed, and any identical lines at
       the end of the block are also removed. This allows you to add
       visual cues such as
     
            # ----------------------------------------
          # :section: My Section
          # This is the section that I wrote.
          # See it glisten in the noon-day sun.
            # ----------------------------------------

<tt>call-seq:</tt>lines up to the next blank line in the comment are
                  treated as the method's calling sequence, overriding
                  the default parsing of method parameters and yield
                  arguments.

<tt>:include:</tt><i>filename</i>include the contents of the named file
                                 at this point. The file will be
                                 searched for in the directories listed
                                 by the +--include+ option, or in the
                                 current directory by default. The
                                 contents of the file will be shifted to
                                 have the same indentation as the ':' at
                                 the start of the :include: directive.

<tt>:title:</tt><i>text</i>Sets the title for the document. Equivalent
                           to the --title command line parameter. (The
                           command line parameter overrides any :title:
                           directive in the source).

<tt>:enddoc:</tt>Document nothing further at the current level.

<tt>:main:</tt><i>name</i>Equivalent to the --main command line
                          parameter.

<tt>:stopdoc: / :startdoc:</tt>Stop and start adding new documentation
                               elements to the current container. For
                               example, if a class has a number of
                               constants that you don't want to
                               document, put a +:stopdoc:+ before the
                               first, and a +:startdoc:+ after the last.
                               If you don't specifiy a +:startdoc:+ by
                               the end of the container, disables
                               documentation for the entire class or
                               module.

------------------------------------------------------------------------
     See also markup/simple_markup.rb.


OTHER STUFF
===========
     Author:   Dave Thomas <dave@pragmaticprogrammer.com>

     Requires: Ruby 1.8.1 or later

     License:  Copyright (c) 2001-2003 Dave Thomas. Released under the
               same license as Ruby.


Warranty
--------
     This software is provided "as is" and without any express or
     implied warranties, including, without limitation, the implied
     warranties of merchantibility and fitness for a particular purpose.

------------------------------------------------------------------------


Constants:
----------
     KNOWN_CLASSES:      {     "rb_cObject"           => "Object",    
                         "rb_cArray"            => "Array",    
                         "rb_cBignum"           => "Bignum",    
                         "rb_cClass"            => "Class",    
                         "rb_cDir"              => "Dir",     "rb_cData"
                                     => "Data",     "rb_cFalseClass"    
                           => "FalseClass",     "rb_cFile"            
                         => "File",     "rb_cFixnum"           =>
                         "Fixnum",     "rb_cFloat"            =>
                         "Float",     "rb_cHash"             => "Hash", 
                            "rb_cInteger"          => "Integer",    
                         "rb_cIO"               => "IO",    
                         "rb_cModule"           => "Module",    
                         "rb_cNilClass"         => "NilClass",    
                         "rb_cNumeric"          => "Numeric",    
                         "rb_cProc"             => "Proc",    
                         "rb_cRange"            => "Range",    
                         "rb_cRegexp"           => "Regexp",    
                         "rb_cString"           => "String",    
                         "rb_cSymbol"           => "Symbol",    
                         "rb_cThread"           => "Thread",    
                         "rb_cTime"             => "Time",    
                         "rb_cTrueClass"        => "TrueClass",    
                         "rb_cStruct"           => "Struct",    
                         "rb_eException"        => "Exception",    
                         "rb_eStandardError"    => "StandardError",    
                         "rb_eSystemExit"       => "SystemExit",    
                         "rb_eInterrupt"        => "Interrupt",    
                         "rb_eSignal"           => "Signal",    
                         "rb_eFatal"            => "Fatal",    
                         "rb_eArgError"         => "ArgError",    
                         "rb_eEOFError"         => "EOFError",    
                         "rb_eIndexError"       => "IndexError",    
                         "rb_eRangeError"       => "RangeError",    
                         "rb_eIOError"          => "IOError",    
                         "rb_eRuntimeError"     => "RuntimeError",    
                         "rb_eSecurityError"    => "SecurityError",    
                         "rb_eSystemCallError"  => "SystemCallError",   
                          "rb_eTypeError"        => "TypeError",    
                         "rb_eZeroDivError"     => "ZeroDivError",    
                         "rb_eNotImpError"      => "NotImpError",    
                         "rb_eNoMemError"       => "NoMemError",    
                         "rb_eFloatDomainError" => "FloatDomainError",  
                           "rb_eScriptError"      => "ScriptError",    
                         "rb_eNameError"        => "NameError",    
                         "rb_eSyntaxError"      => "SyntaxError",    
                         "rb_eLoadError"        => "LoadError",     
                         "rb_mKernel"           => "Kernel",    
                         "rb_mComparable"       => "Comparable",    
                         "rb_mEnumerable"       => "Enumerable",    
                         "rb_mPrecision"        => "Precision",    
                         "rb_mErrno"            => "Errno",    
                         "rb_mFileTest"         => "FileTest",    
                         "rb_mGC"               => "GC",     "rb_mMath" 
                                    => "Math",     "rb_mProcess"        
                          => "Process"
     GENERAL_MODIFIERS:  [ 'nodoc' ].freeze
     CLASS_MODIFIERS:    GENERAL_MODIFIERS
     ATTR_MODIFIERS:     GENERAL_MODIFIERS
     CONSTANT_MODIFIERS: GENERAL_MODIFIERS
     METHOD_MODIFIERS:   GENERAL_MODIFIERS +      [ 'arg', 'args',
                         'yield', 'yields', 'notnew', 'not-new',
                         'not_new', 'doc' ]
     DOT_DOC_FILENAME:   ".document"


Class methods:
--------------
     extract_sections, find_comment, gets, no_comment, usage,
     usage_no_exit

=end
module RDoc

  # ---------------------------------------------------- RDoc::usage_no_exit
  #      RDoc::usage_no_exit(*args)
  # ------------------------------------------------------------------------
  #      Display usage
  # 
  def self.usage_no_exit(arg0, arg1, *rest)
  end

  # ------------------------------------------------------- RDoc::no_comment
  #      RDoc::no_comment()
  # ------------------------------------------------------------------------
  #      Report the fact that no doc comment count be found
  # 
  def self.no_comment
  end

  # ------------------------------------------------------------- RDoc::gets
  #      RDoc::gets(file)
  # ------------------------------------------------------------------------
  #      Find the first comment in the file (that isn't a shebang line) If
  #      the file doesn't start with a comment, report the fact and return
  #      empty string
  # 
  def self.gets(arg0)
  end

  # ------------------------------------------------------------ RDoc::usage
  #      RDoc::usage(*args)
  # ------------------------------------------------------------------------
  #      Display usage information from the comment at the top of the file.
  #      String arguments identify specific sections of the comment to
  #      display. An optional integer first argument specifies the exit
  #      status (defaults to 0)
  # 
  def self.usage(arg0, arg1, *rest)
  end

  # ----------------------------------------------------- RDoc::find_comment
  #      RDoc::find_comment(file)
  # ------------------------------------------------------------------------
  #      (no description...)
  def self.find_comment(arg0)
  end

  # ------------------------------------------------- RDoc::extract_sections
  #      RDoc::extract_sections(flow, sections)
  # ------------------------------------------------------------------------
  #      Given an array of flow items and an array of section names, extract
  #      those sections from the flow which have headings corresponding to a
  #      section name in the list. Return them in the order of names in the
  #      +sections+ array.
  # 
  def self.extract_sections(arg0, arg1)
  end

end
