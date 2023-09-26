import ballerina/io;
import ballerinax/kafka;

type CourseAssignment readonly & record {
    string deadline;
    string mode;
    string presentation;
};

listener kafka:Listener cons = new (kafka:DEFAULT_URL, {
groupId: "group-id",
topics: "dsp"
});

service on cons {
    remote function onConsumerRecord(CourseAssignment[] assignments) {
        from CourseAssignment ca in assignments
        do {
            io:println(ca);
        };
    }
}
