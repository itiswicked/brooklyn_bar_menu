class MenuController < ApplicationController

  def new
    @bar_name = bar_name
    @menu = menu
  end

  def bar_name
    return "The #{pull_word_from(all_streets)}" if percent_chance?(50)
    "#{pull_word_from(all_streets)} & #{pull_word_from(all_streets)}"
  end

  def menu
    (1..10).map { full_menu_item }
  end

  def full_menu_item
    # Make three food item meal
    if percent_chance? 20
      if percent_chance? 50
        menu_item = one_food_item + ", " + one_food_item + " & " + one_food_item
      else
        menu_item = one_food_item + " with " + one_food_item + " & " + one_food_item
      end

    # Make two food item meal
    elsif percent_chance? 40
      if percent_chance? 50
        menu_item = one_food_item + " & " + one_food_item
      else
        menu_item = one_food_item + " with " + one_food_item
      end

    # one food item meal
    else
      menu_item = one_food_item
    end
    { title: menu_item, price: price }
  end

  def one_food_item
    food_item = ""
    # add adjective to ingredient
    food_item += pull_word_from(all_adjectives) + " "  if percent_chance? 55
    food_item += pull_word_from(all_foods)
    food_item += " " + pull_word_from(all_food_shapes) if percent_chance? 40
    food_item
  end

  def percent_chance?(num)
    random_num = rand(0..100)
    num > random_num ? true : false
  end

  def price
    (8 + rand(0..10)).to_s
  end

  def pull_word_from(array)
    array[rand(0..array.size-1)]
  end

  def all_streets
    ["Aberdeen","Adams","Adelphi","Adler","Agate","Ainslie",
    "Aitken","Alabama","Albany","Albemarle","Alice","Allen","Alton","Amber",
    "Amboy","Amersfort","Amherst","Amity","Anchorage","Anna","Anthony","Apollo","Applegate","Arion","Arkansas","Arlington","Ash","Ashford","Ashland",
    "Aster","Atkins","Atlantic","Auburn","Aurelia","Autumn","Aviation",
    "Bainbridge","Balfour","Baltic","Bancroft","Bank","Banker","Banner",
    "Barbey","Barlow","Bartlett","Barwell","Bassett","Batchelder","Bath",
    "Battery","Baughman","Bay","Bayard","Baycliff","Bayview","Beach","Beacon",
    "Beadel","Beard","Beaumont","Beaver","Beayer","Bedell","Bedford","Beekman",
    "Belmont","Belvidere","Bennet","Benson","Bergen","Berkeley","Berriman",
    "Berry","Beverly","Bevy","Bijou","Billings","Bills","Blake","Bleecker",
    "Bliss","Board","Boerum","Bogart","Bokee","Bond","Borinquen","Bouck",
    "Bowery","Bowne","Box","Boynton","Bradford","Bragg","Branton","Brevoort",
    "Bridge","Bridgewater","Brigham","Brighton","Brightwater","Bristol","Bway",
    "Brooklyn","Broome","Brown","Bryant","Buffalo","Bulwer","Burnett","Bush",
    "Bushwick","Butler","Calder","Calyer","Cambridge","Cameron","Campus",
    "Canal","Canarsie","Canda","Canton","Carlton","Carroll","Cass","Catherine",
    "Caton","Cedar","Celeste","Central","Centre","Channel","Chapel","Charles",
    "Chase","Chauncey","Cheever","Cherry","Chester","Chestnut","Christopher",
    "Church","Clara","Clarendon","Clark","Clarkson","Classon","Claver","Clay",
    "Clermont","Cleveland","Clifford","Clifton","Clinton","Clove","Clymer",
    "Cobek","Coffey","Colby","Coleman","Coleridge","Coles","Colin","College",
    "Colonial","Columbia","Columbus","Commerce","Commercial","Concord",
    "Conduit","Congress","Conklin","Conover","Conselyea","Conway","Cook",
    "Cooke","Cooper","Corbin","Cornelia","Cortelyou","Cove","Coventry",
    "Covert","Cox","Coyle","Cozine","Cranberry","Crawford","Creamer","Crescent","Crooke","Cropsey","Crosby","Crown","Crystal","Cumberland","Cypress",
    "Cyrus","Dahill","Dahl","Dahlgreen","Dakota","Danforth","Dank","Dare",
    "DeSales","Dean","Dearborn","Debevoise","Decatur","Degraw","Dekalb",
    "Dekoven","Delevan","Delmonico","Dennett","Denton","Desmond","Devoe",
    "Devon","Dewey","Dewitt","Diamond","Dictum","Dikeman","Dinsmore",
    "Ditmars","Ditmas","Division","Dobbin","Dodworth","Dooley","Doone",
    "Dorchester","Dorset","Doscher","Doughty","Douglass","Dover","Downing",
    "Drew","Driggs","Duffield","Dumont","Dunham","Dunne","Dupont","Durland",
    "Duryea","Dwight","Eagle","Eaton","Ebony","Eckford","Eldert","Elizabeth",
    "Ellery","Elliott","Elm","Elmwood","Elton","Emerald","Emerson","Emmons",
    "Empire","Engert","Erasmus","Essex","Estate","Etna","Euclid","Evans",
    "Everett","Evergreen","Everit","Exeter","Fair","Fairview","Falmouth",
    "Fanchon","Fane","Farragut","Fay","Fayette","Fenimore","Ferris","Ferry",
    "Fillmore","Fiske","Flatbush","Flatlands","Fleet","Florence","Ford",
    "Forest","Forrest","Foster","Fountain","Frank","Franklin","Freeman",
    "Friel","Front","Frost","Fuller","Fulton","Furman","Gain","Gallatin",
    "Garden","Gardner","Garfield","Garland","Garnet","Gates","Gatling",
    "Gaylord","Gelston","Gem","George","Georgia","Gerald","Gerritsen","Gerry",
    "Gilmore","Girard","Glen","Glendale","Glenmore","Glenwood","Gold",
    "Goodwin","Gotham","Grace","Grafton","Graham","Grand","Granite","Grant",
    "Grattan","Green","Greene","Greenpoint","Greenwood","Grimes","Grove",
    "Guernsey","Guider","Gunnison","Gunther","Hale","Hall","Halleck","Halsey", "Hamilton","Hampton","Hancock","Hanover","Hanson","Harbor","Harden",
    "Haring","Harkness","Harman","Harrison","Hart","Harway","Harwood",
    "Hastings","Hausman","Havemeyer","Havens","Hawthorne","Hazel","Heath",
    "Hegeman","Hemlock","Henderson","Hendrickson","Hendrix","Henry","Herbert", "Herkimer","Herzl","Hewes","Heyward","Hicks","High","Highland","Highlawn",
    "Hill","Hillel","Himrod","Hinckley","Hinsdale","Holly","Holmes","Holt",
    "Homecrest","Hooper","Hope","Hopkins","Horace","Hornell","Howard","Hoyt",
    "Hoyts","Hubbard","Hudson","Hull","Humboldt","Hunterfly","Huntington",
    "Hunts","Huron","Hutchinson","Hyman","Ide","Imlay","Independence","India",
    "Indiana","Ingraham","Ira","Irving","Irvington","Irwin","Ivan","Jackson",
    "Jaffray","Jamaica","Jamison","Jardine","Java","Jay","Jefferson","Jerome",
    "Jewel","Jodie","John","Johnson","Joralemon","Joval","Judge","Juliana",
    "Junius","Just","Kane","Kansas","Karweg","Kathleen","Kaufman","Kay",
    "Keap","Keen","Kenilworth","Kenmore","Kensington","Kent","Kermit","Kiely",
    "Kimball","King","Kings","Kingsborough","Kingsland","Kingston","Kingsway",
    "Knapp","Knickerbocker","Knight","Kosciusko","Kossuth","Krier","Lacon",
    "Lafayette","Lake","Lamont","Lancaster","Landis","Langham","Laurel","Lawn",
    "Lawrence","Lawton","Lee","Lefferts","Legion","Lenox","Leonard","Leonora",
    "Lester","Lewis","Lexington","Liberty","Lincoln","Linden","Linwood",
    "Little","Livingston","Livonia","Llama","Lloyd","Locust","Logan","Lois",
    "Lombardy","Lorimer","Loring","Lorraine","Losee","Lott","Louis","Louisa",
    "Louise","Louisiana","Love","Ludlam","Luquer","Lyme","Lynch","MacDonough",
    "MacKay","MacKenzie","Macdougal","Macon","Madeline","Madison","Madoc",
    "Main","Malbone","Malta","Manhattan","Manor","Maple","Marconi","Marcy",
    "Margaret","Marginal","Marine","Marion","Market","Marlborough","Marshall",
    "Martense","Maspeth","Matthews","Maujer","Mayfair","McGuinness",
    "McKeever","McKenny","McClancy","McDonald","McKibben","McKibbin","McKinley","Meadow","Meeker","Melba","Melrose","Menahan","Merit","Mermaid","Mersereau","Meserole","Metropolitan","Miami","Micieli","Middagh","Middleton",
    "Midwood","Milford","Mill","Miller","Milton","Minna","Moffat","Monaco",
    "Monitor","Monroe","Montague","Montana","Montauk","Montgomery","Montieth",
    "Montrose","Monument","Moore","Morgan","Moultrie","Murdock","Myrtle",
    "Narrows","Nassau","National","Nautilus","Navy","Nelson","Neptune",
    "Nevins","New Dock","Newel","Newkirk","Newport","Newton","Nichols","Nixon",
    "Noble","Noel","Nolans","Noll","Norfolk","Norman","Norwood","Nostrand",
    "Nova","O'Brien","Oak","Oakland","Ocean","Oceanic","Oceanview","Olean",
    "Olive","Oliver","Onderdonk","Opal","Orange","Orient","Oriental","Osborn",
    "Otsego","Overbaugh","Ovington","Oxford","Pacific","Paerdegat","Paidge",
    "Palm","Palmetto","Parade","Parkside","Parkville","Parkway","Parrott",
    "Patchen","Pearl","Pearson","Pembroke","Pence","Penn","Pennsylvania",
    "Perri","Perry","Pershing","Pierrepont","Pilling","Pine","Pineapple",
    "Pioneer","Pitkin","Plaza","Pleasant","Plumb","Plymouth","Polar","Polhemus","Poly","Pooles","Poplar","Portal","Porter","Portland","Post","Powell",
    "Powers","Prescott","President","Preston","Prince","Prospect","Provost",
    "Pulaski","Putnam","Quay","Quentin","Quincy","Radde","Rail","Raleigh",
    "Ralph","Randolph","Rapelye""Reed","Reeve","Regent","Remsen","Revere",
    "Rewe","Richards","Richardson","Richmond","Ridge","Ridgecrest","Ridgewood",
    "River","Riverdale","Robert","Rochester","Rock","Rockaway","Rockwell",
    "Roder","Rodney","Roebling","Rogers","Roosevelt","Rose","Ross","Rost",
    "Royce","Ruby","Rugby","Russell","Rutherford","Rutland","Rutledge","Ryder",
    "Ryerson","Sackett","Sackman","Sandford","Sands","Sapphire","Saratoga",
    "Schaefer","Schenck","Schenectady","Schermerhorn","Scholes","School",
    "Schroeders","Schweikerts","Scott","Seabring","Seacoast","Seagate",
    "Seaview","Seba","Sedgwick","Seeley","Seigel","Senator","Seton","Shale",
    "Sharon","Sheffield","Shell","Shepherd","Sheridan","Sherlock","Sherman",
    "Shore","Shore","Sidney","Sigourney","Skidmore","Skillman","Sloan","Slocum","Smith","Smiths","Snediker","Snyder","Somers","Southgate","Spencer",
    "St. Andrews","St. Charles","St. Edwards","St. Felix","St. Francis","St. James","St. Johns","St. Jude","St. Marks","St. Nicholas","St. Paul",
    "St. Pauls","Stagg","Stanhope","Stanley","Stanton","Stanwix","Starr",
    "State","Stephens","Sterling","Steuben","Stewart","Stillwell","Stillwell's","Stockholm","Stockton","Stoddard","Stone","Story","Stratford","Strauss","Strickland","Strong","Stryker","Stuart","Stuyvesant","Sullivan","Summit",
    "Sumner","Sumpter","Sunnyside","Surf","Sutter","Sutton","Suydam","Taaffe",
    "Tabor","Tampa","Tapscott","Taylor","Tech","Tehama","Temple","Tennis",
    "Thames","Thatford","Thomas","Boyland","Thornton","Throop","Tiffany",
    "Tilden","Tillary","Times","Tompkins","Townsend","Troutman","Troy",
    "Trucklemans","Truxton","Tudor","Turnbull","Turner","Underhill","Union",
    "Utica","Van Brunt","Van Buren","Van Dyke","Van Sicklen","Van Siclen",  "Vandalia","Vandam","Vanderbilt","Vanderveer","Vandervoort","Varanda",
    "Varet","Varick","Veranda","Vermont","Vernon","Verona","Veronica",
    "Veterans","Victor","Village","Vine","Virginia","Visitation","Vista",
    "Voorhies","Wakeman","Waldane","Waldorf","Wallabout","Wallaston","Walsh",
    "Walton","Walworth","Warren","Warsoff","Warwick","Washington","Water",
    "Waterbury","Watkins","Waverly","Webers","Webster","Weirfield","Weldon",
    "Wellington","Wells","West","Westbury","Westminster","Wharton","Whipple",
    "White","Whitman","Whitney","Whitty","Whitwell","Will","Williams",
    "Williamsburg","Willmohr","Willoughby","Willow","Wilson","Windsor",
    "Winthrop","Withers","Wogan","Wolcott","Wolf","Woodbine","Woodhull",
    "Woodpoint","Woodrow","Woodruff","Woods","Woodside","Wortman","Wyckoff",
    "Wyona","Wythe","York"]
  end

  def all_foods
    ['ham','plum','marrow','farfalle','seaweed','lamb','sardine','bluefish',
     'chorizo','gravlax','fennel','artichoke','corn','fig','sungold','acorn',
     'sunflower','clam','oyster','rye','butter','anchovy','lime','watermelon',
     'eggplant','pepper','shell bean','peach','ramp','kraut','salt','water',
     'booze','watercress','kale','rice','arugula','pork belly','orecchiette',
     'monkfish','bison']
  end

  def all_adjectives
    ['assorted','french','rustic','rounded','sublimated','country','seasonal',
     'quickened','farm-to-table','awakened','turned','stubbed','cider',
     'japanese','market','beer-braised','lifted','miniature','homespun','folk',
     'expanded','fingerling','spicy','palmed','seasoned','frightened',
     'sea-salt','fermented','sprouted','naive','pressed','massaged','rubbed',
     'late-summer','locally-sourced','artisanal','free-range','crafted',
     'hand-pulled','homemade','natural','activated','tormented','blistered',
     'pan-seared','scraped','sheltered','invigorated','winter','distressed']
  end

  def all_food_shapes
    ['tacos','puree','bombs','extract','bruschetta','platter','crumble',
     'surprise','croquettes','pate','panini','reduction','discs','pie','bun',
     'pancake','toss','toast','bowl','waffle','tartare','jam','spread',
     'souffle','sliders','balls','skewers','salad','frittata']
  end

end
