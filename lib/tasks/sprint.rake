namespace :sprint do
  task :reset do
    Rake::Task["db:reset"].execute
    Rake::Task["dummy_data:create"].execute
    Rake::Task["lisa:fetch"].execute
    Rake::Task["qiita:fetch"].execute
    Rake::Task["scraping:fetch"].execute
  end

  task :fetch do
    Rake::Task["lisa:fetch"].execute
    Rake::Task["qiita:fetch"].execute
    Rake::Task["scraping:fetch"].execute
  end
end
