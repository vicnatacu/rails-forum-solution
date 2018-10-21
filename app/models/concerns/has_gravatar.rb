module HasGravatar
    def gravatar
        "https://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(email)}/?d=robohash"
    end
end