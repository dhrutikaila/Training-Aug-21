interface Vac {
  openings: number;
  Technology: string;
  Experience: string;
}

export class vacancy implements Vac {
  openings: number;
  Technology: string;
  Experience: string;

  dispVacancy() {
    let Vacancy: Vac[] = [
      { openings: 30, Technology: ".net", Experience: "1yr" },
      { openings: 20, Technology: "php", Experience: "6month" },
      { openings: 5, Technology: "java", Experience: "2year" },
      { openings: 2, Technology: "c++", Experience: "2-5year" },
      { openings: 10, Technology: "python", Experience: "0year" },
    ];

    console.log("Vacancy list:")
    for (let i = 0; i < Vacancy.length; i++) {
        console.log(`${Vacancy[i].openings} ${Vacancy[i].Technology}  ${Vacancy[i].Experience}`);
      }
  }

}
