class GiftSerializer

  def self.serialize(gifts)

    serialized_gifts = ''
    gifts_length = gifts.length
    gift_counter = 0
    gifts.each do |gift|
      gift_counter += 1
      serialized_gifts += '{'

      serialized_gifts += '"id": "' + gift.id.to_s + '", '
      serialized_gifts += '"name": "' + gift.name + '", '

      serialized_gifts += '"givers": '
      giver_length = gift.givers.length
      giver_counter = 0
      gift.givers.each do |giver|
        giver_counter += 1
        serialized_gifts += '{'
        serialized_gifts += '"id": "' + giver.id.to_s + '", '
        serialized_gifts += '"name": "' + giver.name + '"'
        if giver_counter < giver_length
          serialized_gifts += '}, '
        else
          serialized_gifts += '}'
        end
      end

      if gift_counter < gifts_length
        serialized_gifts += '}, '
      else
        serialized_gifts += '}'
      end

    end
  
  end

end
