export interface PetitionDetail {
  id: number;
  title: string;
  content: string;
  slug: string;
  createdAt: string;
  updatedAt: string;
  publishedAt: string;
  signatureCount: number;
  author: string;
  extraQuestions: Array<Question> | null;
  afdeling: null | {
      name: string;
      slug: string;
  };
}

export type Question = MultipleChoiceQuestion | FieldQuestion;

export interface MultipleChoiceQuestion {
  question: string,
  choices: Array<string>,
  required?: boolean,
}

export interface FieldQuestion {
  question: string,
  required?: boolean,
}
