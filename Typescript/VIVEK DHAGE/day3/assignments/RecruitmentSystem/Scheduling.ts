
export class schedule<T> {
    interview_time: T;

    constructor(time: T) {
        this.interview_time = time;
    }
    dispSchedule() {
        console.log("Schedule:")
        console.log (`titming is : ${this.interview_time}`);
    }
}
 