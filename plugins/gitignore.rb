#!/usr/bin/env ruby

#
# Ybot return gitignore template
#
# Usage:
#
#  Ybot gitignore erlang
#

require 'net/https'
require 'uri'

# check argument
if ARGV.length != 1
    puts 'Wrong usage.\nUsage:Ybot gitignore erlang'
    exit
end

# langeuage/platform
lang = ARGV[0].capitalize

# accepted
accepted_gitignores = ['Actionscript', 'Android', 'Authotools', 'Bancha', 'C++', 'C', 'CMake', 'CakePHP', 'Clojure', 'CodeIgniter', 'Compass',
                       'Concrete5', 'Coq', 'Dart', 'Delphi', 'Django', 'Drupal', 'Eagle', 'Erlang', 'ExpressionEngine', 'Finale', 'ForceDotCom',
                       'FuelPHP', 'GWT', 'Go', 'Grails', 'Groovy', 'Haskell', 'Java', 'Jboss', 'Jekyll', 'Joomla', 'Jython', 'Kohana', 'LaTeX',
                       'Leiningen', 'LemonStand', 'Lilypond', 'Lithium', 'Magento', 'Maven', 'Node', 'Ocaml', 'Objective-C', 'Opa', 'OracleForms',
                       'Perl', 'PlayFramework', 'Plone', 'Python', 'Qooxdoo', 'Qt', 'R', 'Rails', 'RhodesRhomobile', 'Ruby', 'Scala', 'Sdcc',
                       'SeamGen', 'SketchUp', 'SugarCRM', 'Symfony', 'Symfony2', 'SymphonyCMS', 'Target3001', 'Tasm', 'Textpattern', 'TurboGears2',
                       'Typo3', 'Unity', 'VisualStudio', 'Waf', 'WordPress', 'Yii', 'ZendFramework', 'gcov', 'nanoc', 'opencart']

# Check accepted languages
if not accepted_gitignores.include? lang
    puts 'There is not gitignore for ' + lang + '\nChose from:\n' + accepted_gitignores
    # return
    exit
else
    # Github api url
    api_url = 'https://raw.github.com/github/gitignore/master/' + lang + '.gitignore'

    # Make http request
    uri = URI.parse(api_url)
    http = Net::HTTP.new(uri.host, uri.port)

    # ssl request
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Get.new(uri.request_uri)

    # return
    puts http.request(request).body
end

