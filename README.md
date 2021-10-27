# api_intergration

A test api code.

## Getting Started

This project is demotration for implement api hub

## Setup

1. add dio to your project(https://pub.dev/packages/dio)
2. copy all the services/api_service to your project
 
You are ready to go!


## Implement

A new api hub will need some steps:

1. modify your host: in api_services.dart 
```
ApiService("https://reqres.in/api")
```
2. To create a new api you need 3 files: input, output and request

    2.1 input: to control the input(example list_user_input.dart, create_user_input.dart), some node below:

        - override RequestMethod for method of your request
        - override resourcePath for path ( example: https://reqres.in/api/resigter) so it should be "register"( the host represented in step 1 apiService)
        - override buidSendParamenters(), I process all code underline, so get/post/put/delete now you can use the same params here
        - override buidSendHeaders() to add some header to your code if needed
    2.2 output: to control the output(example list_user_output.dart, create_user_output.dart), some node below:

        - override buildFromJson to return your object from a string
        - create some default for later use(you can check the function static getDefault(), it should be same style for other requests)
    2.3 request: to connect all thing together, just specify inpoput,output(list_user_request.dart,create_user_request.dart)

        - please told compliler about your class using `extends Apiable<your_input_type, your_out_put_type>`

3. To call the api, simply call it 
ListUserRequest: request

```
ListUserRequest requestToMake = ListUserRequest(
      input: ListUserInput(page: 1),
      output: ListUserResponse.getDefault(),
    );
final result = await apiService.excuteRequest(requestToMake);
```

now you can access the response simply(they will know your type without any casting here)

```
 print(result.output.total);
```

Please check the project file main.dart with 2 apis(1 post and 1 get) implemented for more detail