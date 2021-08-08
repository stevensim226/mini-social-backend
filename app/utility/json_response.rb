def build_response(object, status)
    return {
        success: status,
        content: object
    }
end