require 'aws-sdk'

module Secresea
  class S3
    def self.load_secrets_from_s3
      if @secrets_obj.exists?
        @secrets = @secrets_obj.read.split("\n")
      else
        @secrets = []
      end
    end

    def self.secrets
      @secrets
    end

    def self.setup
      AWS.config(
        access_key_id: ENV['AWS_ACCESS_KEY_ID'],
        secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
        region: 'us-west-2'
      )
      s3 = AWS::S3.new
      @bucket = s3.buckets['secresea']
      @secrets_obj = @bucket.objects['secrets.txt']
      self.load_secrets_from_s3
    end

    def self.add_secret(secret_string)
      @secrets << secret_string
      @secrets_obj.write @secrets.join("\n")
    end

    def self.shift_secret
      secret = @secrets.shift
      if !secret.nil?
        secret = secret.gsub('\n', "\n")
        @secrets_obj.write @secrets.join("\n")
      end
      secret
    end
  end
end