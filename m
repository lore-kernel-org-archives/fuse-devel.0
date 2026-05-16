Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380A63E4C7F
	for <fuse-devel@lists.linux.dev>; Sat, 16 May 2026 15:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778945746; cv=pass; b=ao3UPRLfvZ0vnqgMN8hTnaxsDe19tyerxYgerbx8clbEXg8HFM7XdipsdDe8sWRVMn+MFd1kMBKfoTBZg757JuiCUCQl5kD+l8gxvZq+p77JHcEreBR7pt5nkfs3VHG6IZym6fZMdH/+tmRDQWKaK+tF3PPPBOkXjvpund1P/Jc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778945746; c=relaxed/simple;
	bh=fpwS1NISlMl4eRyrN9kTF1MNlwgsDu4mXgeWlhdxKrU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l9QStQl9wQP680dhS2oGx9zio2kbtI8U8KqcSgrcw0RiDVSx5dBjiNiO/Z33c7ZtR4ak1bLRl1qDgmXHqg/DjnOtmBw7JdRyzZ+ZkLqcSL8ndxpCWYX6xzdHiHwh9q4apE3x6ZrhzhcODiVaq/Bnmku6a5MYeR+ennivg/PxQdc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CRZ47Qti; arc=pass smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CRZ47Qti"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-bcc2b199c17so109588866b.3
        for <fuse-devel@lists.linux.dev>; Sat, 16 May 2026 08:35:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778945742; cv=none;
        d=google.com; s=arc-20240605;
        b=DfHaZ3vFlBxATT+QmzkKQaLz8zdQv7Uoob4KJCR1FWs4s2Ju6gP4Cozpu7pGmTA8G2
         rGF05MOgFTYg8qeLVyFc1jvsteoa4WJluuQGdECjow5k2P2xmAoenu+qEK9rV5JESHIh
         p0rYC4rm35x2OjeOnn3Tnwfa3CG0KxoBj4ttM/PYytq8AD7RRAvJ/K1RUS95ISjxAwXW
         TGaoS3a7/CU40Yy+9k7DVqKKyO1Nvqfa1TU5QLK7tgsoq/PmrUg+FN/usx24INr4bQo4
         frLoFZmZXGD/82qQEX6jkHlyBh5UVsb6Tbnkf/Ts31pfTP56j0H1O3zXatmWJ/1kI5/Z
         ytGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zA9VjGoCdws4GITccriUwfqMhrSo1TzaklLYoRAlCIQ=;
        fh=3ocWaTTsjEiaHmohihpy+//Z2YpXHL9vGREW74p7ghY=;
        b=jyqYtwtPKmWTOqkEouzJ4r0C1JGShm6vWznKOrlOFIh1VtLa+Z+tUWRmXVteGq9vTL
         rXP0Vdr3TOMbBj1narA8RCRO4c/FWeX81poPdWjiLzBDFfmZYhVomlxDVyx399LBOLlA
         u6sbPbmCBSGXARhblquKMbnHn62NvQy7wD0Q8fUy/6cOdBcjHUyWjEuiKytmIU8EOzr5
         C1py1Bm4DfrEz6bP4UXiLrwGk33GXzvO/htbLjnLV4fN87t0uDGZh4X7BqHz9wPzHA30
         ff7UPpKCPy2L3IC/UoZqzDvWJyyA7gGz+1OGjFrGl4lHVK4J/qpVqdpiMkisP/cq/isr
         l4dg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778945742; x=1779550542; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zA9VjGoCdws4GITccriUwfqMhrSo1TzaklLYoRAlCIQ=;
        b=CRZ47QtiRp5w1001bkX7RCfmV36Owky6pO2FiFnAK51Qgl95F6xgkcgwK8ZEwCcU+L
         adUW3/B0o3G8cueSGNM/IA8uE0CgKA1ON8rfKr6KPcrSQGw/vbG66KLpfP/CJbqv8E+T
         tYfCK3UxdFATVXKDRhXlOpy+J54cdza8eVZ8NdDDNR6ANU0u7lW4XV6g/5CZBWUAcSfM
         hCYZQd670bKYxVH6IAfrNFz8x0x4F+H+pFgaRAH7J8jqCOfoGqlx1GZ3NGpVsKiHTjUd
         APxmTdCBvodLic0r0+ivNOgWj3s+bgyDerd8gVJ4zTUVPxv952TwyXVcptnlmM036Id/
         CP8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778945742; x=1779550542;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zA9VjGoCdws4GITccriUwfqMhrSo1TzaklLYoRAlCIQ=;
        b=sKvjJwSOB2EorVDkwHNGxDd2macvMpp215YR43uH7S1Nkijg0IY6Hy7uSWRZWfbvF1
         Ps1oB3W1xyZ2yr3B38lJHA5NfSYUYCxMMFjx2g5ViUqvmXAWVBOjVrhJzI8BlwcBA4Iy
         W/93vg3FFVoaIOD33kooFYvE6ZJTwhBUGFzI++4iXzAb83yNSVUqmd3oRMzaOc3hO8Yk
         ZLIkhDora+igffbbq0E8LDNG39leCEFEQNaMNZSeg+fXxCqcCEFW7vlrdYNvfBtDoETW
         1hIZDk7wqlfT98+6E278OEU95C4K6/RgTCsmL4B17X2oIDQkb1B+5NcX57tTYx2+JViC
         On3g==
X-Forwarded-Encrypted: i=1; AFNElJ/dToVGyF3eU1l8mpu7S0aI0fkCPdMfaTmEaUtam8EGMRt5G3goK5E9OsgDW6osHztNHLoVrEozcyr+@lists.linux.dev
X-Gm-Message-State: AOJu0YyvIP/AUGeLQcmRpXnO22HAwr8cA0FYoUOPPihz7wLO3Uq5q2VB
	3kE56P+sEi1tWvfLgYLMGyt8A98XMHkKtliyaJRxMx5F1m6An0zffoBhLc5AxqqT49CmCSJAf2E
	fREfGaSNPjPN13H3HcO3NsZBXBZI/Bpk=
X-Gm-Gg: Acq92OEmGb+rDJXywJmDMcZxgn5NOGs/w0HRK5nW3isdM89BgLTMZW5Z8KF3ppBNKbl
	29BYlUGGzH24H1oOvP+YSNSLZUge9DCPRPWJUa/r+INmXQEt19+72gP6PaEjORFCb214VGBS3dT
	lfyO3mAoOXLNAdet1JmZLwThIGixIo4mZyyf9y0iZqISeht88L6pSxO5kQaWQw53CEEqx8B+oEf
	Z+JL/k9uKVCat7daLxK3mV0QTODdYOl2Wr5n56mmAVR2QVzEVYgtN8GTpF4U4iPrrMMBf7Icl4X
	w81WASqADKXi/CZpqbuWvuwxytLYGL4xWTikNRYovQ==
X-Received: by 2002:a17:907:c80e:b0:bd4:f814:dbbe with SMTP id
 a640c23a62f3a-bd517814c55mr466886666b.19.1778945741468; Sat, 16 May 2026
 08:35:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260516004004.1455526-1-joannelkoong@gmail.com> <20260516004004.1455526-9-joannelkoong@gmail.com>
In-Reply-To: <20260516004004.1455526-9-joannelkoong@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Sat, 16 May 2026 17:35:30 +0200
X-Gm-Features: AVHnY4Lv_tfty6tyl73Y0An7au81a6zgjoX6IM4U97tOfr4AKz4REFsBPKZvBnw
Message-ID: <CAOQ4uxhUvy_+AEF10H7C1mH8ue9uDQuvcaPJqsMGssWawJZc4Q@mail.gmail.com>
Subject: Re: [PATCH v2 08/21] fuse: handle zero ops_mask in FUSE_DEV_IOC_BACKING_OPEN
To: Joanne Koong <joannelkoong@gmail.com>
Cc: miklos@szeredi.hu, fuse-devel@lists.linux.dev, 
	linux-unionfs@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 16, 2026 at 2:52=E2=80=AFAM Joanne Koong <joannelkoong@gmail.co=
m> wrote:
>
> Servers that pre-date the ops_mask field will pass a zero ops_mask in
> FUSE_DEV_IOC_BACKING_OPEN. Default this to FUSE_PASSTHROUGH_RW_OPS to
> maintain backwards compatibility.
>
> For FUSE_PASSTHROUGH_INO servers, an ops_mask must be set.
> FUSE_PASSTHROUGH_INO is a new feature with no backwards compatibliity
> requirements.
>
> Signed-off-by: Joanne Koong <joannelkoong@gmail.com>

Reviewed-by: Amir Goldstein <amir73il@gmail.com>

> ---
>  fs/fuse/backing.c | 20 +++++++++++++++++---
>  1 file changed, 17 insertions(+), 3 deletions(-)
>
> diff --git a/fs/fuse/backing.c b/fs/fuse/backing.c
> index 2234ab47406a..b499860e1185 100644
> --- a/fs/fuse/backing.c
> +++ b/fs/fuse/backing.c
> @@ -119,9 +119,23 @@ int fuse_backing_open(struct fuse_conn *fc, struct f=
use_backing_map *map)
>         if (map->flags || map->ops_mask & ~FUSE_BACKING_MAP_VALID_OPS)
>                 goto out;
>
> -       /* For now passthrough inode operations requires FUSE_PASSTHROUGH=
_INO */
> -       if (!fc->passthrough_ino && map->ops_mask & FUSE_PASSTHROUGH_INOD=
E_OPS)
> -               goto out;
> +       if (!fc->passthrough_ino) {
> +               /*
> +                * For now passthrough inode operations requires
> +                * FUSE_PASSTHROUGH_INO
> +                */
> +               if (map->ops_mask & FUSE_PASSTHROUGH_INODE_OPS)
> +                       goto out;
> +               /*
> +                * To maintain backwards compatibility with servers that
> +                * pre-date the ops_mask field, a zero ops_mask defaults
> +                * to passing through both reads and writes
> +                */
> +               if (!map->ops_mask)
> +                       map->ops_mask |=3D FUSE_PASSTHROUGH_RW_OPS;
> +       } else if (!map->ops_mask) {
> +               return -EINVAL;
> +       }
>
>         file =3D fget_raw(map->fd);
>         res =3D -EBADF;
> --
> 2.52.0
>
>
