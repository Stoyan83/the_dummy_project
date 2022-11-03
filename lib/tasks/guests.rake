namespace :guests do
  desc "Remove guest accounts more than a weak old."
  task :cleanup => :environment do
    User.where(guest: true).where("created_at < ?", 1.weak.ago).destroy_all
  end
end