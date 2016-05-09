class CountryLocation
  attr_reader(
    :country_code
  )

  def initialize(params={})
    @country_code = params.fetch(:code, 'ES')
  end

  def subregions
    Carmen::Country.coded(@country_code).subregions
  end

  def subregions_array
    @subregions = Carmen::Country.coded(@country_code).subregions
    sanitize(@subregions.map(&:name))
  end

  private

    def sanitize(elements)
      elements.collect do |item|
        item.gsub(/,(.)*/, '')
      end
    end

end
