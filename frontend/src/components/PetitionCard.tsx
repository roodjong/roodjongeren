import {
    Dispatch,
    FormEvent,
    ReactNode,
    SetStateAction,
    useCallback,
    useEffect,
    useState,
} from "react";
import { FaSpinner } from "react-icons/fa";
import { PetitionDetail, Question } from "../models/Petition";
import { submitPetitionSignature } from "../utils/backend";
import PetitionFormBox from "./PetitionFormBox";

interface Props {
    className?: string;
    petition: PetitionDetail;
    link?: ReactNode;
}

enum State {
    Initial,
    Submitting,
    Error,
    Existed,
    Success,
}

const SESSION_KEY = "petitionData";

function ensureSessionStorage(): { [key: string]: boolean } {
    const data = sessionStorage.getItem(SESSION_KEY);
    if (!data) {
        sessionStorage.setItem(SESSION_KEY, JSON.stringify({}));
        return {};
    }
    return JSON.parse(data);
}

function savePetition(petition: PetitionDetail) {
    let data = ensureSessionStorage();
    data[petition.id] = true;
    sessionStorage.setItem(SESSION_KEY, JSON.stringify(data));
}

async function handleSubmit(
    petition: PetitionDetail,
    name: string,
    email: string,
    questionAnswers: Array<{ question: string; answer: string }>,
    setState: Dispatch<SetStateAction<State>>
) {
    setState(State.Submitting);
    try {
        const result = await submitPetitionSignature(
            petition,
            name,
            email,
            questionAnswers
        );
        if (!result) {
            setState(State.Error);
        }

        savePetition(petition);
        if (result.existed) {
            setState(State.Existed);
        } else {
            setState(State.Success);
        }
    } catch {
        setState(State.Error);
    }
}

function renderInputForQuestion(
    questions: Array<Question & { value: string }>,
    setQuestions: Dispatch<SetStateAction<Array<Question & { value: string }>>>,
    index: number
) {
    const q = questions[index];
    if ("choices" in q) {
        const emptyOption = <option key="empty" value=""></option>;
        return (
            <select
                className="w-full h-8 rounded-md text-black p-2"
                onChange={(e) => {
                    setQuestions(
                        questions.map((q, i) => {
                            if (i === index) {
                                return { ...q, value: e.target.value };
                            } else {
                                return { ...q };
                            }
                        })
                    );
                }}
                required={q.required ? true : undefined}
            >
                {emptyOption}
                {q.choices.map((c, i) => {
                    return (
                        <option key={i.toString()} value={c}>
                            {c}
                        </option>
                    );
                })}
            </select>
        );
    }
    return (
        <input
            className="w-full h-8 rounded-md text-black p-2"
            value={q.value}
            onInput={(e) => {
                setQuestions(
                    questions.map((q, i) => {
                        if (i === index) {
                            return { ...q, value: (e.target as HTMLInputElement).value };
                        } else {
                            return { ...q };
                        }
                    })
                );
            }}
            required={q.required ? true : undefined}
        />
    );
}

function renderExtraQuestions(
    questions: Array<Question & { value: string }>,
    setQuestions: Dispatch<SetStateAction<Array<Question & { value: string }>>>
) {
    return questions.map((q, i) => (
        <>
            <div key={`label-${i.toString()}`}>
                <label>{q.question}</label>
            </div>
            <div key={`input-${i.toString()}`}>
                {renderInputForQuestion(questions, setQuestions, i)}
            </div>
        </>
    ));
}

export default function PetitionCard(props: Props) {
    const petition = props.petition;
    const [state, setState] = useState(State.Initial);
    useEffect(() => {
        if (state != State.Success && ensureSessionStorage()[petition.id]) {
            setState(State.Existed);
        }
    });

    //   const extraQuestions = (petition.extraQuestions ?? []).map((q) => ({
    //     state: useState(""),
    //     ...q,
    //   }));
    const [extraQuestions, setExtraQuestions] = useState(
        (petition.extraQuestions ?? []).map((q) => ({ value: "", ...q }))
    );

    const nameId = "name-field"; // CHANGEME: update to useId in react 18
    const emailId = "email-field"; // CHANGEME: update to useId in react 18

    const [nameInput, setNameInput] = useState("");
    const [emailInput, setEmailInput] = useState("");

    const onSubmitCallback = useCallback(
        (e: FormEvent) => {
            e.preventDefault();
            handleSubmit(
                petition,
                nameInput,
                emailInput,
                extraQuestions.map((q) => ({
                    question: q.question,
                    answer: q.value,
                })),
                setState
            );
        },
        [petition, nameInput, emailInput, extraQuestions, handleSubmit]
    );

    if (state == State.Submitting) {
        return (
            <PetitionFormBox className={props.className}>
                <div className="self-center py-20">
                    <FaSpinner className="animate-spin" />
                </div>
            </PetitionFormBox>
        );
    }
    if (state == State.Error) {
        return (
            <PetitionFormBox className={props.className}>
                <div className="py-20">
                    Er is iets mis gegaan bij het opsturen.
                </div>
            </PetitionFormBox>
        );
    }
    if (state == State.Existed) {
        return (
            <PetitionFormBox className={props.className}>
                <div className="py-20">
                    Je hebt deze petitie al een keer ingevuld.
                </div>
            </PetitionFormBox>
        );
    }
    if (state == State.Success) {
        return (
            <PetitionFormBox className={props.className}>
                <div className="py-20">
                    Succes! Check je email om je handtekening definitief te
                    maken.
                </div>
            </PetitionFormBox>
        );
    }

    return (
        <PetitionFormBox
            className={props.className}
            onSubmit={onSubmitCallback}
        >
            <>
                <h2 className="font-title text-3xl font-bold mb-4">
                    Teken nu voor {petition.hook}!
                </h2>
                {props.link && <p>Meer weten? {props.link}</p>}
                {petition.signatureCount > 5 && (
                    <p>
                        Al {petition.signatureCount} mensen hebben deze petitite
                        ondertekend!
                    </p>
                )}
                <div>
                    <label htmlFor={nameId}>Naam:</label>
                </div>
                <div>
                    <input
                        id={emailId}
                        type="text"
                        required
                        className="w-full h-8 rounded-md text-black p-2"
                        value={nameInput}
                        onInput={(e) => setNameInput((e.target as HTMLInputElement).value)}
                    />
                </div>
                <div>
                    <label htmlFor={emailId}>Email:</label>
                </div>
                <div>
                    <input
                        id={emailId}
                        type="email"
                        required
                        className="w-full h-8 rounded-md text-black p-2"
                        value={emailInput}
                        onInput={(e) => setEmailInput((e.target as HTMLInputElement).value)}
                    />
                </div>
                {renderExtraQuestions(extraQuestions, setExtraQuestions)}
                <button
                    type="submit"
                    className="mt-4 font-title text-2xl font-bold border-white border-4 rounded-lg p-1 px-4 w-min"
                >
                    Teken!
                </button>
            </>
        </PetitionFormBox>
    );
}
