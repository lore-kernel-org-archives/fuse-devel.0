Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B953C9885
	for <fuse-devel@lists.linux.dev>; Wed, 15 Jul 2026 09:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784108431; cv=pass; b=eWl0pzQE/GSmdgcQKC7tiI3yI20snH5Wm8jCCEEsCME8pV6MhII3FkmzhN0oNE99v2X1EqUclj11u0on75+3WlY+QEC+dfAulLbLV3qAH43m+jStCSn4CtAKaJm5gFvsjd2nYwrVsopSX+xtN/K4i0AJALGIN5bbJwMctyDcNyk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784108431; c=relaxed/simple;
	bh=u5x5UjFfiIypuUG/u8VBeYI24RclQQxYRKNVOEumIHY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R4t8rujILt1VKdGhdPGot8sAGIoW6oKgJAJ6zVrtc84ZcjMjTTqhPi4r7w967pUFbiV5weIWJoJRWDhhf6VRjTljBbltZdK3oaff2TkjTJf/RxbAQL8cIykH3deMwkpPkvsSLnkzfi+Xg1/7/fVIolQLb2nIgpRS/2XTL54UeI4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qAGRH/xz; arc=pass smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qAGRH/xz"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c15e03c2763so392591166b.0
        for <fuse-devel@lists.linux.dev>; Wed, 15 Jul 2026 02:40:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784108416; cv=none;
        d=google.com; s=arc-20260327;
        b=kMuza6Pa5Ehq3oJ/kl49l68o1sRAP9h4tT5qbZFqg8fqYZlhqf+bQTlisOBnkNiKvD
         gdE6HrhIE0GfvT7AAofPDD6OzQRKAivpEGw96GJ5lUDEdO1X95L9YpMoV5Bwfi42qmke
         ULUL32IfGu0Bhp2nMNaX8d9qPoo6Z2fZNqpl4rKfisHiRLTospf9ENdN+o0TeY+d2f3b
         41jqScFyXZDOgM0PWFVYHC9AEDKBJFxf35XnS6Fd5tWS1eKrH6PGC8T1SdzEadF286me
         goQtIabXLo/ksb9OX+mQrkxS5biQZjJ/5md9D6rRUsaiP6tcNA4vwyVgpE56iaB5g2ZJ
         9zUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ayP+P5/Pd6BGHZjCoYBRcVoPcvH07ra6Sodaq/Yi54U=;
        fh=/w4JtELTj7U53mK0tyAMyHDu9WFMxaog5Bcmri9BMcY=;
        b=Y1vJBpeq21nXkrPG/tL77LYrI99AKqcU66/uCc0YBra2QssNmgp7o3g5IDFEkZkcOq
         a4my+phqImGGouk5rNthvoumhAf8Ao8Us20z4z+Jr31Y8GNYafqF3cPfakNLI1EM7zHR
         CaJLf9K9MBjSy5aOlx51FN+X3cRTNbfo9PjPWg1uTmkY1lxulVZUM3894bVoNhkeoIXU
         TSJGGJMKTYvwv5GU5w1ao4T/mezcj1xXiVpBQqo3MrFTetzID8Yxj4+G8BdRSLxbqtG/
         tXXDJg5VMWAmCGaXTJwLONGDp+PVQD5EghLyNyNzsAYRwDvLUTZswTrrVtZm+4948flu
         wpwA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784108416; x=1784713216; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ayP+P5/Pd6BGHZjCoYBRcVoPcvH07ra6Sodaq/Yi54U=;
        b=qAGRH/xzMzztyJkVB2H2+ET56nzzjNF4moMuErSM5sBrXTvrjW4vKIQxhOAOaUEw20
         IsNl+6beZpU9s3T1V01eqtqN4wulVGCX58d2J3ru6K/GIuYOb4zL8esvvBXhQcph2RDf
         2aw2+BHDJ4b0bm5lVkTL13NQ7TgAby7ixnSisnP4xT1AXfT8xrl73R1t9J5xgnROm0Fd
         81BQ21vNwNAoKZMHN4Ar9laOSVjLOPOpupEQXSEtRyyI8v4s0Lwetdadz3dkoCs43VyY
         +7CbsUcwsdEsn+JTlqoJ0LPuykzolk98mOGPlSvLn/LDlmoBZAPENBhKY+poRnb6a/uO
         s9TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784108416; x=1784713216;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ayP+P5/Pd6BGHZjCoYBRcVoPcvH07ra6Sodaq/Yi54U=;
        b=Lsk6SD/DQSDgXdtJtrCeHeeeZ7X3XANIs+oRoT/oMVbTk5Nqw5CsDVHAQ8U10ZfE69
         /zAYTZapI/hF0xF3uXUnG1gKMO9hFL29wXz227Y7iIhllHk8PWU/5ObAJjzqB8QJ5ew6
         E/jbbC6+58IR8jlwaQX5OySW9b6cC57A+4LfKUFm1HDm3rZp7Oqm0pHx9S5/8IMhOi0r
         dHK4Fl7qWB3gN7h4SotpMOeLBVxncnjRHt8aI6mh76tZbK4kP+udlJ3HjZAICSk0h7Wn
         nVkIgHB3NHRgeQUPyiZjlabEa9boUXwlpEW/rjI5imr7tqEIeRq2IpvpQl8Cqc+fBS0m
         XpAg==
X-Forwarded-Encrypted: i=1; AHgh+RopqZUGNcGJcHaVre+xoIAO6YirYu9+ynZGf2xUzqW2NQimzLndsAR0kDeR/gOjbismPM31WxRviB8p@lists.linux.dev
X-Gm-Message-State: AOJu0YwM1wgn8wBueVwvmpb3UPXvpv+5Y/CyY2MFdjC74tKp2ennA6UX
	TKjnMTLPg6a/LDl1PdzKof/Nizy6vret84FbPCYiloSZGNw770yGNn5Z1FVC1fnMiEw/A7QT9e6
	zqSxD9u40uK+Mqh0FuGmrOGcg2A/V0KM=
X-Gm-Gg: AfdE7clOdLGXoETqlN1pqE9cQbzIYi1wdSQVhkDitK4bQzd6xdhZuIc6sSm/Zsda7lX
	vtTQ4OCIllRVJtuXty6MSDuVYCR/LnRM7zqcEY9fqmo/DLxo+ThuH0BRhSlhh6M5PCOKMxTt/nK
	YdGwDgB9XVJQxxYEMzvFcws1FqiRaZUggUAyN0e4qtzWBsJN3uiDWEWd6/p7Bkk1CGK7qhGefHM
	Lqe82mWZ9LsIWk1Ye6eXhUkLXfXTpo4c2rzkrBHxf7PMSebxzgsEtw0m/w/FP4TdWBS0quLbA==
X-Received: by 2002:a17:907:6e86:b0:c08:5bdb:e904 with SMTP id
 a640c23a62f3a-c161e89a8f7mr791839866b.9.1784108416323; Wed, 15 Jul 2026
 02:40:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260713220932.413004-1-amir73il@gmail.com> <20260713220932.413004-2-amir73il@gmail.com>
 <20260715-seilschaft-fahrbahn-talstation-6c45445d2535@brauner>
In-Reply-To: <20260715-seilschaft-fahrbahn-talstation-6c45445d2535@brauner>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 15 Jul 2026 11:40:05 +0200
X-Gm-Features: AUfX_mxOzjZVXHNjf0PogjbfsvYj10SoFZT144LLQab9SavhtKt6eUxVr6kJ1c4
Message-ID: <CAOQ4uxh0J6CMCeUYRQX7buf+SHp2Az4kvWWvtMk9A1h-tqhmmQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] fs: preserve ACL_DONT_CACHE state in forget_cached_acl()
To: Christian Brauner <brauner@kernel.org>
Cc: Miklos Szeredi <miklos@szeredi.hu>, linux-fsdevel@vger.kernel.org, 
	fuse-devel@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 15, 2026 at 11:02=E2=80=AFAM Christian Brauner <brauner@kernel.=
org> wrote:
>
> > The ACL_DONT_CACHE state is meant to be a constant state for the inode
> > for filesystems that want to opt out of posix acl caching.
> >
> > Commit facd61053cff1 ("fuse: fixes after adapting to new posix acl api"=
)
> > used this facility to opt out of posix acl caching for fuse inodes with
> > fuse server that does not negotiate FUSE_POSIX_ACL (fc->posix_acl).
> >
> > The commit also takes care to gate the forget_all_cached_acls() call in
> > fuse_set_acl() on fc->posix_acl because there is no need for it, but
> > there are other placed in fuse code which call forget_all_cached_acls()
> > unconditional to fc->posix_acl and those cause the loss of the
> > ACL_DONT_CACHE state.
> >
> > This is not only a functional bug. Properly timed, a get_acl() from thi=
s
> > fuse filesystem can return a stale cached value, as was observed in tes=
ts,
> > because set_acl() does not invalidate the unintentional acl cache.
> >
> > We could fix this in fuse, but it actually makes no sense for the vfs
> > helper forget_cached_acl() to invalidate the ACL_DONT_CACHE state, so
> > let it not do that to fix fuse and future users of ACL_DONT_CACHE.
> >
> > Fixes: facd61053cff1 ("fuse: fixes after adapting to new posix acl api"=
)
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Amir Goldstein <amir73il@gmail.com>
> >
> > diff --git a/fs/posix_acl.c b/fs/posix_acl.c
> > index b4bfe4ddf64e..3dc62c1c2708 100644
> > --- a/fs/posix_acl.c
> > +++ b/fs/posix_acl.c
> > @@ -93,6 +93,13 @@ static void __forget_cached_acl(struct posix_acl **p=
)
> >  {
> >       struct posix_acl *old;
> >
> > +     /*
> > +      * ACL_DONT_CACHE is expected to be a "const" value and xchg it w=
ith
> > +      * ACL_NOT_CACHED would enable acl caching for the inode -
> > +      * clearly not what the caller has intended.
> > +      */
> > +     if (READ_ONCE(*p) =3D=3D ACL_DONT_CACHE)
> > +             return;
>
> Still on vacation this week but I took a glimpse:
>
> If this isn't what the caller intended, having ACL_DONT_CACHE end up
> should be treated like a bug. So shouldn't this then be a WARN_ON_ONCE()
> and return?

The caller has requested to *forget* any *cached* *acl*.
The value ACL_DONT_CACHE means that there are no cached acls to forget
so the call is a success.
Therefore, WARN_ON is not called for IMO.

Sorry to interrupt vacation.
Let's continue when you get back.

Thanks,
Amir.
