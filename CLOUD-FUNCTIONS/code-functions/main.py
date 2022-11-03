def hello_world(request):
    request_json = request.get_json()

    # Set CORS headers for the main request
    headers = {
        'Access-Control-Allow-Origin': '*',
        'Access-Control-Allow-Methods': '*',
        'Access-Control-Allow-Headers': '*',
        'Access-Control-Max-Age': '3600'
    }

    if request.headers.get("Message"):
        return (request.headers.get("Message") + " - " + str(request_json), 200, headers)
    else:
        return (str(request.headers) + " - " + str(request_json), 200, headers)