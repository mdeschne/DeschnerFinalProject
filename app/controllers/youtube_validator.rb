class YoutubeValidator < ActiveModel::Validator
  def validate(record)
    unless record.media_url.starts_with? 'www.youtube.com'
          unless record.media_url.starts_with? 'https://www.youtube.com'
            unless record.media_url.starts_with? 'https://m.youtube.com'
      record.errors[:media_url] << 'must be a valid Youtube address'
    end
  end
end
end
end
