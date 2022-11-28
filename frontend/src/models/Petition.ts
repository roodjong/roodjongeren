export interface PetitionDetail {
    id: number;
    hook: string;
    createdAt: string;
    updatedAt: string;
    publishedAt: string;
    signatureCount: number;
    extraQuestions: Array<Question> | null;
}

export type Question = MultipleChoiceQuestion | FieldQuestion;

export interface MultipleChoiceQuestion {
    question: string;
    choices: Array<string>;
    required?: boolean;
}

export interface FieldQuestion {
    question: string;
    required?: boolean;
}
