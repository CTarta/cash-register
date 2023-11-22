# README

I have chosen to implement this solution under the form of an API in order to maintain a certain flexibilty and changeability for the future. Possible scenarios would be additing and endpoint for expanding the list of registered products or updating the details of existing ones.

## Setup instructions

After cloning the project locally, you will need to navigate to the project folder and run the following:

- `bundle install`
- `rake db:create`
- `rake db:migrate`
- `rake db:seed`
- `rails s` to get a local server running and listening on http://127.0.0.1:3000

## Usage instructions using cURL

`curl -X GET "http://127.0.0.1:3000/api/v1/products/total_price" -d "items[]=GR1&items[]=GR1"`

```
{"total":"3.11€"}
```

`curl -X GET "http://127.0.0.1:3000/api/v1/products/total_price" -d "items[]=SR1&items[]=SR1&items[]=GR1&items[]=SR1"`

```
{"total":"16.61€"}
```

`curl -X GET "http://127.0.0.1:3000/api/v1/products/total_price" -d "items[]=GR1&items[]=CF1&items[]=SR1&items[]=CF1&items[]=CF1"`

```
{"total":"30.57€"}
```
