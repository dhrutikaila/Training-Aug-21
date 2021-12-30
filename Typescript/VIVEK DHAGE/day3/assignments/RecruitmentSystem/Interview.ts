
export class Interview<T,U> {
    PerformanceRate: T;
    Interviewer: U;

    constructor(rate: T, name: U) {
        this.PerformanceRate = rate;
        this.Interviewer = name;
    }
    dispInterview() {
        console.log("Interview:")
        console.log ("performance: " + this.PerformanceRate + ", interviewer " + this.Interviewer );
    }
}
