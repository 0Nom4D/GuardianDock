import {DestinyMembership} from "./DestinyMembership.enum";

export type DestinyMembershipInfo = {
    "iconPath": string;
    "crossSaveOverride": DestinyMembership;
    "applicableMembershipTypes": Array<DestinyMembership>;
    "isPublic": boolean;
    "membershipType": DestinyMembership;
    "membershipId": string;
    "displayName": string;
};

export type UserInfoCard = {
    "bungieGlobalDisplayName": string;
    "bungieGlobalDisplayNameCode": string;
    "bungieNetMembershipId": string;
    "bungieMembershipId": string;
    "destinyMembership": DestinyMembershipInfo;
};
