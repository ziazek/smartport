# encoding: utf-8

##
# Backup Generated: rails_database
# Once configured, you can run the backup with the following command:
#
# $ backup perform -t rails_database [-c <path_to_configuration_file>]
#
# For more information about Backup's components, see the documentation at:
# http://meskyanichi.github.io/backup
#
Model.new(:rails_database, 'Backups of the Rails Database') do

  ##
  # PostgreSQL [Database]
  #
  database PostgreSQL do |db|
    db.name               = DB_CONFIG["database"]
    db.username           = DB_CONFIG["username"]
    db.password           = DB_CONFIG["password"]
    db.host               = DB_CONFIG["host"]
    db.skip_tables        = []
    db.socket             = DB_CONFIG["socket"]
    db.additional_options = ["-xc", "-E=utf8", "--no-owner", "--no-acl"]
  end

  # http://meskyanichi.github.io/backup/v4/storages/
  time = Time.now
  if time.hour == 0
    if time.day == 1  # first day of the month
      storage_id = :monthly
      keep = 6
    elsif time.sunday?
      storage_id = :weekly
      keep = 3
    else
      storage_id = :daily
      keep = 12
    end
  else
    storage_id = :hourly
    keep = 23
  end

  ##
  # Amazon Simple Storage Service [Storage]
  #
  store_with S3, storage_id do |s3|
    s3.path   = "/#{RAILS_ENV}/#{storage_id}"
    s3.bucket = ENV['S3_BUCKET']
    s3.keep   = keep
  end

  ##
  # Gzip [Compressor]
  #
  compress_with Gzip

end
