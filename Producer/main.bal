import ballerina/io;
import ballerinax/kafka;

type CourseAssignment readonly & record {
    string deadline;
    string mode;
    string presentation;
};

public function main() returns error? {
    kafka:Producer prod = check new (kafka:DEFAULT_URL);
    io:println("Welcome to the Kafka tutorial...");
    CourseAssignment msg = {
deadline: "29/01/2021",
mode: "git-repo",
presentation: "TBD"
};
    check prod->send({topic: "dsp", value: msg});
}
