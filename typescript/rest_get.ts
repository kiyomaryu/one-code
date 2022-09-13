#!/usr/bin/env node
import axios from "axios"

export async function main() {
    const res = await axios.get<String>("https://monitor-api.kiyomaru.me/v1/item/idlist")
    console.log(res.data)
    return res
}

main();
