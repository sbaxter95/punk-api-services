# Punk API 

Service Object Models for the [Punk API](https://punkapi.com/documentation/v2)

## Installation

* Clone or download the files from the git repo 
* Use the ```ruby beers_object.rb``` command in the terminal (or using the bash shell in Windows) to run the ruby script
* Modify the beers_object.rb file as directed below for services, or follow instructions for testing below

## Services

* If there is not an object already instantiated, instantiate an object of the BeerServices class  
e.g. ```beer = BeerServices.new``` 
* To find a single beer based on the id, add the following code: ```beer.single_beer_service('id')```
* To display all of the beers, use the ```beer.all_beers_service``` code
* To display a random beer, use the following code: ```beer.random_beer_service```
* There is also a service for searching using one or more search parameters - the following code block shows an example of how this service could be used:

```
beer.check_for_params({'yeast' => 'Wyeast_1056_-_American_Ale', 'abv_gt' => 8})
beer.add_params_to_url
beer.search_beers
```
* The ```check_for_params``` method is the method in which the user can enter search paramaters as a **hash**
* Please note that curly brackets **'{}'** are required, as well as the older 'hash rocket' notation **'=>'**

## Methods

## Testing

* Ensure that there is a spec directory and .rspec file in the repo 
* If there isn't, run the ```rspec --init``` command in the terminal (or bash shell for Windows)
* The spec_helper.rb file can be configured to your liking - the recommended configuration is below:

```
require 'json'
require 'httparty'

RSpec.configure do |config|
  config.formatter = :documentation
end
```
* Create a file in the spec directory where tests will be run - it can be called anything, but **must** have \_spec.rb at the end  - in this case, the name of the file is beer_spec.rb
* To run the tests, run the ```rspec``` command

## Technologies

* Ruby
* rspec
* httparty gem
* json gem
* git for version control