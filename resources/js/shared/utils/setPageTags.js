import { useMeta } from "vue-meta";

export default function (page) {
    useMeta({ title: page.title });
    useMeta({ description: page.description });
};