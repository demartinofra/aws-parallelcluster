namespace parallelcluster

@documentation("AWS Region. Defaults to the region the API is deployed to.")
string Region

@pattern("^[0-9]+\\.[0-9]+\\.[0-9]+$")
string Version

list Versions {
    member: Version
}

list Tags {
    member: Tag
}

structure Tag {
    @documentation("Tag name")
    key: String,
    @documentation("Tag value")
    value: String,
}

structure ConfigValidationMessage {
    @documentation("Id of the validator")
    id: String,
    @documentation("Type of the validator")
    type: String,
    @documentation("Validation level")
    level: ValidationLevel,
    @documentation("Validation message")
    message: String,
}

list ValidationMessages {
    member: ConfigValidationMessage
}

@enum([
    {name: "info", value: "INFO"},
    {name: "warning", value: "WARNING"},
    {name: "error", value: "ERROR"},
    {name: "critical", value: "CRITICAL"},
])
string ValidationLevel

@enum([
    {value: "CREATE_IN_PROGRESS"},
    {value: "CREATE_FAILED"},
    {value: "CREATE_COMPLETE"},
    {value: "ROLLBACK_IN_PROGRESS"},
    {value: "ROLLBACK_FAILED"},
    {value: "ROLLBACK_COMPLETE"},
    {value: "DELETE_IN_PROGRESS"},
    {value: "DELETE_FAILED"},
    {value: "DELETE_COMPLETE"},
    {value: "UPDATE_IN_PROGRESS"},
    {value: "UPDATE_COMPLETE_CLEANUP_IN_PROGRESS"},
    {value: "UPDATE_COMPLETE"},
    {value: "UPDATE_ROLLBACK_IN_PROGRESS"},
    {value: "UPDATE_ROLLBACK_FAILED"},
    {value: "UPDATE_ROLLBACK_COMPLETE_CLEANUP_IN_PROGRESS"},
    {value: "UPDATE_ROLLBACK_COMPLETE"}
])
string CloudFormationStatus
