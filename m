Received: from mail-ed2-f34.google.com (mail-ed2-f34.google.com [74.125.228.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 042DC4A1DFB
	for <fuse-devel@lists.linux.dev>; Wed, 30 Sep 2026 10:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790765318; cv=pass; b=kniy38LSINT+1Ua1wX1z8VOjrx7dLsOx7Gpiym4WCCpA8WE5+QVQBe9EPreCbFNBstM+FpPKO5AN9R84P1AmLYQJYnhMvHRViGtoCNEFFHFOQdhLofYA/Xe2WeyADP9Y90QXOeWIn4XFKNtSziuDF1fra7XPIqou1tnkdp9M4Lo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790765318; c=relaxed/simple;
	bh=RNRpFiUamIkA8BAFj3jCSMm9Ff3c2qxylU7LhlkhyxI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RnkxoPUeVKZUT3F9C9qMGjS7xO98cdK0YuIuG1A4Pu2uPUs6c3OjVNl7WJ7WyXhmSKexesabpDhIqSQUAsNOM/B8BeuTicX0YH9ZyaTadijbNCS2qWF8HNiDCHBNbXATocWRXoPTI4hvzqq6Egkg/ebD9UgnhsPN4KOAywbrnEM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NVYSQpGy; arc=pass smtp.client-ip=74.125.228.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NVYSQpGy"
Received: by mail-ed2-f34.google.com with SMTP id 4fb4d7f45d1cf-6aae1f2cedfso6768877a12.3
        for <fuse-devel@lists.linux.dev>; Wed, 30 Sep 2026 03:48:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790765306; cv=none;
        d=google.com; s=arc-20260327;
        b=osCBWTj08F3b0+hrcXl7ucduzDC+yPvLmsyKNUvMRvksyX/8FRFTlm0Ta3wKOIKRvF
         O2eEuaUZOh3xTnM7F0bF0VQogNpkrYCQfdt52B+02ezVBJlXdbeCdpaRmJ4Z5LX0OVaw
         Sw0TW8ftohbU1KyeT6oPSSrSMKMB6F2BiRmiouiuiqATFiG2yPg4eVG0UtOSGW9GCqOx
         137XKwCyUCtSMeLWFqPfwJEAlJ1jUvEBP2C9/lJABIbKvwyvGK8ls/fSv9FcyoopIKkE
         ti3zb5lA5bfX23roPtSfqOnlxRP1PON/K3rX+2CQwetboIysSPMsJDY1JKExDV4Y2nVw
         GQnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=L6WRkvlPa7sw2NEEZZhaZzuA+bxHBxPihqU3EKBl72A=;
        fh=qJjdePgJuTEH5jSr29Fu9PkZEfiD1rRP5PP9opC1vDs=;
        b=OFivVNgecd5AllfftVBrlS84zqjiCv1u6Fhyoxm4eDyvzwUOzSruyxGoWK/p7RJBmQ
         REgLxjO3xe98kwQNYeLP5YVWAXz8haKz7MdoCiAOKwkIcgDSClX3Yq67smLGHwfD9WSu
         T54UhFU6SZKWMPcy10jzvYTu48RzzUf42ZbiEJR6y2LHLkS/c+SL3suOPPL2XjlbK0Hw
         8TBVndOFL0R3ho9udpmDLDPJakz8RcozMn1gamy72CIdOo7kFa7xN+fjw4P13AHvwaMy
         WNemuJtMwy01JKPALRJunYoOaE68nZ8xP2c8BsATnMfV7c+Z0PTC/MEOMbM4SZip03vY
         toDg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790765306; x=1791370106; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L6WRkvlPa7sw2NEEZZhaZzuA+bxHBxPihqU3EKBl72A=;
        b=NVYSQpGy/fyV3x7+PbtF+jxUarqnKh6xCiFj6Z37Qi/kkprGvr48qb9RVileTkV2HG
         2c0fEj3cS4oS1XQziw6AawI87mooJh21kQ0XZ/nBCKwkY852gudF7D7bF9emVMh3N6NS
         8RprlWYxpc48ziT2n1YiqVRixpVKqSRrFpobIbkPzsRJq9V4ocugXMr7O85aug1XkZjn
         I1U3lrHdCrY1x7t1L+DWWXRlwCG6sMVU82Xb+eSA5iV2okqnYKlvLKzI/2VfqT5CDXrP
         4Vy4otjeTk4DjynFlEVQBOjTlWWn1FXNTg421TbKYJDkysz/sOhiOSEy2k7acrRXlDI5
         /czQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790765306; x=1791370106;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L6WRkvlPa7sw2NEEZZhaZzuA+bxHBxPihqU3EKBl72A=;
        b=mU6JpJcazVRIt2BTk9tFAfqAjkUivI7OhQzmAA0qq0I+UfAb45Ba31Lj2yP3sQBrn/
         JFSYYH1KtmB8DiOnfbcG8MFT5KAH26HbwH2Kc6pS6BGPZAJ+ipsESW6yjwZ1R4RfmNLX
         ggcHbBI6c0GFBhA1vZIQk7n+S5TjQFxdF/sG81VerzOSqbNFQ7yvlaxMy3WSFoRLWxPc
         DFqW+hxNgbmKVeB/lk17yNaXtad4onUWICulbNAnTQVQq2BORnJAYFRcfnIeVNgPf86u
         IkEDewMSxtL+Z09hLkKeKZG47mx5fynd5XjwY6akj4jVuFF1/I6VFpBXS/jmo1NWE16Z
         tICQ==
X-Forwarded-Encrypted: i=1; AKwUvBy/YIKgVE5kkQkNYPZ9qkugBzTHcSPfkDLsueZr/MHtx0eoQqgWf/SYIn3AkhRuj1JGW3IwaAb1gotO@lists.linux.dev
X-Gm-Message-State: AFq9FYLj4XVV80X0kr93oMiT30wKJpHTSJXeK5kFYo9ag61EimcSHQ6m
	GtObdM+N91w8BePt9xPnWrAaU7o+/3Ljimb4KuUagP5LkmZNiF6wVbJYu8k+8VSNMKVHivFgxYb
	9gl3ePO63fWURoMUwmIRgRLdjC1TirYM=
X-Gm-Gg: AYBFou3bcTs/4RCDrRtKqTN9vbIIHXzHXLfXGD8j1LdSSj7OZ+mJUGQpbBcl+tbGhHr
	odErrMZTo2nNqM5HYvIfB3WViVkULgDw1wuKXEZQCG/8x9sDfAr3sD7HH9vVCK+aND9riRkN73M
	NREgMl58IScLHex8QqTu0n5Fknb6KchS2ySldGvpK9IXC4MQ0X3aHrw6YsB4gR+QnSHJl7dtUyR
	TkERY/aeLk3a0xWFuPCeecwrfb6E9Fe5V6aYFb5e73erjnNGu8TEJHBLxxE05iiMroSjbzHdkEM
	D2DOWusbVfkYr9ero0IlGw31V3OrSQZFnqEwJ8bPFLdQ3QTcJnCyifxA
X-Received: by 2002:a05:6402:a0c5:b0:6ac:77c2:c418 with SMTP id
 4fb4d7f45d1cf-6ae1985d094mr556763a12.1.1790765305275; Wed, 30 Sep 2026
 03:48:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260922061019.3320196-1-mszeredi@redhat.com> <20260922061019.3320196-7-mszeredi@redhat.com>
 <CAOQ4uxgfEM3CiBCCu53MDJnHDiYOmmMB5zZ1pqABUPiFag67-g@mail.gmail.com> <CAJfpegupC6qG3GcziSeqzNUz7OjWcaxPV2TydBBO7hShm02CHg@mail.gmail.com>
In-Reply-To: <CAJfpegupC6qG3GcziSeqzNUz7OjWcaxPV2TydBBO7hShm02CHg@mail.gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 30 Sep 2026 12:48:13 +0200
X-Gm-Features: AclHuK9iBukJS84onYStzKo9w6RS2o1y0ddrTAn2bG-zejZLWr95R8m6LjRRWME
Message-ID: <CAOQ4uxj6gDqmZ9Vct9fcYj84K1hN2npfhvgFp6fV6Omj-rsHgg@mail.gmail.com>
Subject: Re: [PATCH 06/11] fuse: support 64 bit, server allocated backing ID
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: Miklos Szeredi <mszeredi@redhat.com>, fuse-devel@lists.linux.dev, 
	John Groves <john@groves.net>, "Darrick J . Wong" <djwong@kernel.org>, 
	Joanne Koong <joannelkoong@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 12:15=E2=80=AFPM Miklos Szeredi <miklos@szeredi.hu>=
 wrote:
>
> On Wed, 23 Sept 2026 at 09:09, Amir Goldstein <amir73il@gmail.com> wrote:
>
> > On second look at this uAPI and after failing to retrofit ops_mask into
> > fuse_backing_map, I think it would be better, along with init flag
> > FUSE_PASSTHROUGH_V2, to decommission both old ioctls
> > and use new ioctl with consistent verbs for the new notify's:
>
> Yes, unfortunately the "map" verb is overloaded:
>
>  - map from backing_id to realfile
>  - extent map
>
> Would be nice to find something better for the backing_id mapping to
> avoid confusion.
>
> How about:
>
>   FUSE_DEV_IOC_BACKING_CREATE/struct fuse_backing_create_in
>   FUSE_NOTIFY_BACKING_REMOVE/struct fuse_backing_remove_out
>
> ?

Sounds good to me.

>
> I'm not opposed to FUSE_NOTIFY_BACKING_MAP, as that tells us it's
> operating on a backing.

OK, flags namespace check:

/**
 * flags for fuse_backing_create_in
 *
 * FUSE_BACKING_CREATE_ID_64: not needed
 * FUSE_BACKING_CREATE_INO_ATTACH: for illustration
 */

struct fuse_backing_create_in {

/**
 * notify_backing_map flags
 *
 * FUSE_BACKING_MAP_CREATE:    create backing with the supplied ID
 * FUSE_BACKING_MAP_CYCLIC:            map repeats after last extent
 */

struct fuse_notify_backing_map_out {

FUSE_BACKING_MAP_CREATE is somewhat awkward, but still works IMO.

Thanks,
Amir.
