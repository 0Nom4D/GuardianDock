import {DestinyMembershipInfo, UserInfoCard} from "../types/UserInfoCard.type";
import { DestinyMembership } from "../types/DestinyMembership.enum";

export const parseDisplayName = (displayName: string): [string, string] => {
    const parsedName = displayName.split('#')
    return [parsedName[0], parsedName[1]]
}

export const SerializeUserInfo = (data: any): UserInfoCard => {
    let membershipInfoArray: Array<DestinyMembershipInfo> = [];

    for (const membership of data.destinyMemberships) {
        const newMembership: DestinyMembershipInfo = {
            iconPath: membership.iconPath,
            crossSaveOverride: Object.values(DestinyMembership).indexOf(membership.crossSaveOverride as DestinyMembership),
            applicableMembershipTypes: membership.applicableMembershipTypes.map((item: number) => Object.values(DestinyMembership).indexOf(item as DestinyMembership)),
            isPublic: membership.isPublic,
            membershipType: Object.values(DestinyMembership).indexOf(membership.membershipType as DestinyMembership),
            displayName: membership.displayName,
        } as DestinyMembershipInfo;
        membershipInfoArray = [...membershipInfoArray, newMembership];
    }

    return {
        bungieGlobalDisplayName: data.bungieGlobalDisplayName,
        bungieGlobalDisplayNameCode: data.bungieGlobalDisplayNameCode.toString().padStart(4, '0'),
        bungieNetMembershipId: data.bungieNetMembershipId,
        destinyMemberships: membershipInfoArray
    };
}