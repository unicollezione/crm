module CardsHelper
  def notes_for(card)
    card.notes.gsub(/\n/, '<br/>').html_safe
  end
end
