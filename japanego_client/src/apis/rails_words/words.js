import http from "../instance/instance";

export const word_all_list = () => http.get("/word");

export const wordDetail = (wordNo) => http.get("/word?wordNo="+wordNo);
