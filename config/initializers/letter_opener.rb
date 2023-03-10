if Rails.env.development?
  LetterOpener.configure do |config|
    config.location = Rails.root.join('tmp', 'letter_opener')
  end
end
