import {parseDisplayName} from "./utils";
import {API_ROUTE, BUNGIE_API_KEY} from "@env";

export const fetchUsers = async (id: string) : Promise<any> => {
    const [displayName, displayNameCode] = parseDisplayName(id);

    if (displayName === undefined || displayNameCode !== undefined)
        return {};
    const response = await fetch(API_ROUTE + '/User/Search/GlobalName/0/', {
        method: 'POST',
        headers: {
            Accept: 'application/json',
            'Content-Type': 'application/json',
            'X-API-KEY': BUNGIE_API_KEY
        },
        body: JSON.stringify({ "displayNamePrefix": displayName })
    });

    if (response.ok)
        return response.json();
    console.error('An error occurred when trying to fetch users.');
    return null;
};

export const fetchPvEStatsForUser = async (membershipType: number, membershipId: string) : Promise<any> => {
    const response = await fetch(API_ROUTE + '/Destiny2/' + membershipType + '/Account/' + membershipId + '/Stats/?groups=General', {
        method: 'GET',
        headers: {
            Accept: 'application/json',
            'Content-Type': 'application/json',
            'X-API-KEY': BUNGIE_API_KEY
        }
    });

    if (response.ok)
        return response.json();
    console.error('An error occurred when trying to fetch User Stats');
    return null;
};
