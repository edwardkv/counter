class Link

  def add(links)
    redis = Redis.new

    time = Time.now.to_i

    links.each do | l |
      uri = URI.parse(l)
      domain = uri.host

      if domain.nil?
        domain = l
      end

      hash = {domain: domain, time:time, link: l }
      puts hash
      #
      #redis.rpush('links', hash.to_json);
    end

  end

end
