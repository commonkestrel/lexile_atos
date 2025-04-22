require 'faraday'
require 'uri'

module Atos
  BASE_URL = URI("https://www.arbookfind.com/default.aspx")
  REQUEST_HEADERS = {
    "Content-Type" => "application/x-www-form-urlencoded",
    "Accept" => "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8",
    "Cookie" => "BFLexile=False; BFUserType=Librarian"
  }

  CONN = Faraday.new(
    url: BASE_URL,
    headers: REQUEST_HEADERS
  )

  BODY_START = "__LASTFOCUS=&__EVENTTARGET=&__EVENTARGUMENT=&__VIEWSTATEFIELDCOUNT=2&__VIEWSTATE=6Djc91ST8Ef%2B3mXkBBLXiEHe%2F9JVHBItQZs0erNkHic%2FgHtBcJbjewkAXK%2Bc1xPU8UeQOiDYw0FY5E2KbO5aLNl0qO8cKla5w7lBoD0qQ5aoNBl062%2BNaWpcaWsF7q84HBuWglGgsQy1LsGAXqQ5ssl8qOoPocHvtXr8pJOOd8ngDTCRlWczlcOHY794UC6KS8UcrjKF1ierpW%2BC04olZ2KKqjKehPil4KAUqeTEaDsUVxz1hkkAnTJqWCU5Vcah5dQnDI2Z3V5KaQ96v8Bcffp7Nw12fAaIxLE8%2FIsPHjZ6VDSdYBVe30GlqS0mlkrEAgJqdV0DY2h0TosX%2B1jnEA63llI0KNQBk1OmkZEdpJXAYFiKJn2USnhpuY4R6HIjbJ%2BEuJ3bcTLirqpAYhOctUZEPVH0OjlLUe9l%2BCRSiMJTd7lKF2wlgOANZN5w2DYYnSDCSOvlkbjUqI2U5IlNNufgSt%2F0DXiTB3DCImsuGG1rKBbuScU4ItJl5DAyR2fXzgH5emc1bWHK%2BszCEIT0faApTPDptV6JIn5DmOpCDGv9hS98%2F1d8n36ZFNwMFai0shnjniw9r75pfLqjd9vw28%2BdWVHuINo6XX9tSUHvgM5qfGlA9Gs82gEnvXRTeeNtGAyHU8KdbgVDQGYjQ05PQysJLpn4UsNGhvta4rCtNgE%2BjhjO%2F%2BgQLpKoa%2BQZraVoNTcA%2Bwc7vmnBWi9Gr96L6j8XCQLdgJRnOuCDg%2F8e0bOPXtQc7I30kJoV9QQ5HQqq%2BZcdtRc3tVEYFgxrnoZv8Un%2BXVI8%2F777g7qcXONvpW6zrzQDe%2FrhSJwgw%2BEdcKJDOqgPOVrC%2F5wcrH9sdIuonZCqd2HZsfwol4TFpvRJbfiBZYBC0IvclH9gCWhCIA4eH7HxjfXcZ0o6SKmWebBDZE%2BBWOJJcKKntxi3dFFW9NdysOvRDkukx%2FQspTEZ%2BjoIBPLqVICsPulRYXMhPexwHP3a626n2VBTrHpkO1qydt%2BI8V5uS1rDVGWi2Zz25nSM&__VIEWSTATE1=lxk1fpixNlAPTLWq6T7cPCWHRl%2FGPgW%2B6plIodKd3C8B1D3Tb0aiEidmgI%2B%2BThl158MIcqiiATzL6UDWky7Ppb80pF2ye%2FZwfwroMzBpvrIpGibP0CZrcr%2FdUDJiaBfcDzSip3fsJbPmK8bvsj6kCQ63dSfFMZAdMnNTDEkBgD4PJuelUcNInABrCV5CFx8gJNjRRKd5hlQgav2W0rgBIKgAjmB2u7c5MznZ6oK%2BG5F2jV9JLVTDtqAvJW4zZ1YnY83Z9aQTIidwC%2BabQ3uvsrDcde%2Bo2K8I4YGFWyUTk3PLjNv6WrwKOSnhkQuWbmHohdkVXDNlf%2FXdmFmJTd%2FFUDsoiaJmwGE1Le%2BPyY%2B595qOl%2BpV%2FYQzWc8angrir9%2B%2B3R5XS7yZEKtUhbv78r2IDtz50IySO8xp%2FRaIG0xOhl6SUVuKTzL6nfletOnNSzXjceKUosQTF%2B%2Flhb1oTS762B5ieXJy%2BoGP51cwt%2BchdO%2BwDk3Ph3sE92oS1XoSBaJIp%2BssGwziomHi4QkA97gCoWah%2BhkWNz8BDDo%2B%2FCS57JDO8Ic3UV8GyRughUqFuVPZOWSZQ0qj91B8PeEi3RADGia%2FJ2uf4RpM71xYru2rjLNB4mV4%2Ffbfc1GrhmWkC1c5F7OL2zeqySwK2G%2FVqhgMBAWTkgCGVdO54DaBCLRiFV3%2FJD%2FioxDKpr2bQYtdJ4kSdyjTF0xdmMvBZCGblA0uKbetZBUMmzuDqP8S%2F%2BowPxDcGV16yCWyEO73IlZKPIXsTrJT3jlfDhgjXlGkpcsGjtwAb9m8xtxOBeB9qPqpa9Wg03b%2BjPfILW6s0%2FvOlvjeS0bhekemovC3JsBQ3562Lvn3uDrwkHlPudWD6DWuJpkb9Gj9jECJ3shC8KGTJpvf&__VIEWSTATEGENERATOR=CA0B0334&__EVENTVALIDATION=iMXwUg9Ni57A2V%2FL3jsI3njjM8Lm8WB9GCwYJQQg5RZAdArDxMbkJMrZPziwBvKESBo18QwFvEBweWahVQs57FYHz6bozLb32w7SCWFt%2Bvpv9WFzjMgvPrG6QMA3wIrxqS6fNJ18PPUpyLuabLKIQTRyOayhwTsN6icuT67YPU5MomTPboWQ5MDeGCfp0bc7K%2FGSWJi28%2BJeUbZ1yBWvmu8J7Ybv%2B6RWG6S4jOnPOutJg4xtK42ligvScAzv7vADkPn%2BaLWZ6suV%2BoqXCh5roA%3D%3D&ctl00%24__SAVESCROLL=0&ctl00%24clientDateDay=17&ctl00%24clientDateHour=10&ctl00%24txtKeycode=&KeyCodeSubmitField=&ctl00%24ContentPlaceHolder1%24txtKeyWords="
  BODY_END = "&ctl00%24ContentPlaceHolder1%24btnDoIt=Search"

  def Atos.search(isbn)
    response = CONN.post("/") do |req|
      req.body = "#{BODY_START}#{isbn}#{BODY_END}"
    end

    score = response.body.split "BL: <strong>"

    if score[1]
      score = score[1].split "</strong>"

      score[0].to_f
    else
      nil
    end


  end
end