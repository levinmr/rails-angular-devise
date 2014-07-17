require 'fileutils'

namespace :mydoc do
  desc "Generate Ruby Documentation"
  task app: :environment do
    # Uses .yardopts_app file in rails root
    app_dir = 'doc/generated/app'
    sh "rm -rf #{app_dir}"
    sh "bundle exec yardoc --plugin rails --yardopts .yardopts"
  end

  desc "Generate JavaScript Documentation"
  task :js do
    # Even if in a subdirectory, run as if run from Rails Root
    # Uses .jsdoc_conf in rails root

    jsrun_path  = File.join('doc', 'support', 'jsdoc-toolkit', 'jsrun.jar')
    run_js_path = File.join('doc', 'support', 'jsdoc-toolkit', 'app', 'run.js')
    conf_path   = File.join('.jsdoc_conf')

    sh 'rm -rf doc/generated/javascripts'
    sh "java -jar #{jsrun_path} #{run_js_path} -c=#{conf_path}"
  end
end

desc "Generate All Documentation"
task :mydoc => ['mydoc:app', 'mydoc:js']