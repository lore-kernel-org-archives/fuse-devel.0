Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01BBE38887E
	for <fuse-devel@lists.linux.dev>; Fri, 22 May 2026 21:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779484508; cv=pass; b=Ofezem2co+2pox6TioheXUt3I5vPNYchGTJbpY92ua18A5pRdCNEMX9sRS5Z0NWfIBE7LY3kMcQwgVbuZtFFyyTjLgdTjQPwcyrdQCFRA6uijqkSJF66XpdrB+fQCUEEa4uJd3AEyy7ioDu7OFn7b21o65yAViEzceqqI8ipcyI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779484508; c=relaxed/simple;
	bh=8fDZLT+DGTSlLlbClakQKysQzTuWiXBNMT1u6D/prQ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZqqCZzOtpi5kTw76S+Ft9aYBEp+g/TGwbEy+m+gDx+4xpo9NDU/8/QSWjH0YsLw02iHiK+E4sy40l/u1WMpCdFkqsfmhy/SBqIAFrsgAUsLmkVIB8HH1W4uS7AAiqkruLfDCIuKxdoPWhWmEphxhxuVx4+BMWQln0vlTht7UU4s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q6A70o6F; arc=pass smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q6A70o6F"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-43d73422431so5529481f8f.2
        for <fuse-devel@lists.linux.dev>; Fri, 22 May 2026 14:15:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779484505; cv=none;
        d=google.com; s=arc-20240605;
        b=O+V4FfyGY7JktVcMq0eXnlqYJOuFTPQ3Yb2MSby5sLhBn38wxqlv6MvSK0oHB+SHRO
         9bt/v5PLB7nmk6WyFK49BIQoYbgPykRbgMduzNlIGWoTWSrNSU1fG2GgVLZhnGrG5+oY
         dGWKD6O++wLz20x1J4v96n/Euxee4wp27yInsFANY0jSNqBoeSuhRHpZHESt38slL/2h
         BzRQu8aPkfIK2cZF19i/2v6SqxGkRrJfYFnUKxqP6yk9HFsMCJuaJxsy52FeCz7D6SXg
         43UdsQ6jbMLNEyJeCgK0H002/FwckQ6UGZzLQsDV28z1hQS/um1Nz/be+pNf3MzCj450
         LXYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=K+fkEOdj7Z1JEJ2NurQ548ANs9aMyd1+wpvBGl5H9HQ=;
        fh=tKi847kKzL3aMJ4LOCLMoYzBGDIY3YodiMU+5DL3y6A=;
        b=OO3q6pKvG1P/Ww6kbsuVWrIeMRAdkYtAsq/XdD7E/p07n0fVxPOAUueM93C9LCxS2y
         InV6qCc0l5RNY5AuknZJorHb8v+CyscW0rh2pEyIK8cZq6aC5g36ZpaBZI6p4skWWxqK
         vPVq58pqbaD6gME7SpruJ2q87G6B2OEKSQNy4XMyGD26isoHkraVNrWZci7c4LxkxtmJ
         Uy9N0u1Z9rnGtCczUumbDd6rlXusU5whtcuhyK2amf5MYS4S6Oa4A3zOOkHcl+Dr0Ywd
         V32Lv+XEW12HU99ZGmyJhIIMaQ0TyiLpKNBYTGH2aOEku5AfT6nZfyAMra1e62IKqh42
         fRbw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779484505; x=1780089305; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K+fkEOdj7Z1JEJ2NurQ548ANs9aMyd1+wpvBGl5H9HQ=;
        b=q6A70o6FiXTevgBsJmCmtDwOI9IkTe760Uh4lzV89pEyUJi5huc2wUqTqGix84Om9v
         MpxcKfyzOs80npNKCId2Pg5t6rv9QM3MvMpPntxh3elLoR5HXibS8JnhamPOzuc0C7bx
         50VrBr0ePpYcuNIl5Nl+NvZXq1JPD0CuERadgf5ZPI0nxgakYKAozhGDnpONfMpWyplb
         cku7aeeZvG+xWIdMENf4L+snwPKQs3HJzvCT9HSxjDoxgss9JaS0Gk6zJLVFpfo7hzz1
         fTfcJOpfGaHATGpvwPz1GSbYKlFiUoCJiccaXR1+fLKV6fxRGssa7NFoSdGvu1GNUWvz
         USvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779484505; x=1780089305;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K+fkEOdj7Z1JEJ2NurQ548ANs9aMyd1+wpvBGl5H9HQ=;
        b=MLjZXqHmOKwf4ETCjBg4VH+axmvZUW9F1c+TtB3gcPGmXRNu4XnBvqQ0iFMICUQ/0m
         LaeIwwpd1g0NorlREY5m4NcUz2U9nl6mRp/5t+xEw2lm8i4+hFw3drMQL1rhVv6xCmJ3
         Z08yPB2bnqr18ZW6bVtLiJRKJ5lP/FHaCp8mEFA4wcL3o1ng+y0tnjp25GWvp2ze5k3a
         cv/DkHfaqkShK3n9JP9Cw5QucpO/9XPsydpmmOKL2OmisEQfngYMaf84IrmPmLGGRmZ+
         jN7Ea3YJvYjCraHwDUpTCgwdvXW7y925JshtE0aZeQNuT8t4wcsFz2neu7dBpZ/obECU
         hZeA==
X-Forwarded-Encrypted: i=1; AFNElJ/ehNySZKOB1ndINqRppIBzI0GXb6yeR+7ZH5PTsjBJWZBi5u9tdcIEpMXzAtwO2gQVHhxCfUSYcAbM@lists.linux.dev
X-Gm-Message-State: AOJu0YxEmDet1OW4mNmV+ckj/4x0Oz/np54MkzBctyFuD4JluziOzysh
	fEr+tZZ+FcON1vq9u41giJzOFZKqM1uN6dhQhQSI3jupjI1E6WtQeepKV9nuFvGZ9PB54+V3qaG
	GKq0ue0cBpzj1AbKUjY9KBJCvvB3B3Ys=
X-Gm-Gg: Acq92OGPCXRlmA6Cyi9YKFJVG5U42CJgqbzZWOrK86RoEvMUnC4QymNoGf3+U7Ujf1a
	qFFISNFIW2gSqqnAqQ7LMnmynbtTdyfGe5x0pTGkC/uPzTnwQDXP1pPApw2kZGXo7hRSqLQjCcN
	EN67fAuRx8C7w39Y4/r+iVi8Iv+anMm4eq5zywau9XDsprXNddG7gBRBh4iIFde4wjasVAO+rPT
	Irzjh1uZSRdKGkYFzo8g90/slLFKY+X2K5MSTHlh3POzjmwheIBnnARK0KY357G4qjMATPtgRgS
	7X/1+w==
X-Received: by 2002:a05:6000:29d2:b0:43d:7c6c:a0dd with SMTP id
 ffacd0b85a97d-45eb38be1b0mr6445250f8f.35.1779484505316; Fri, 22 May 2026
 14:15:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260522205823.1597313-1-joannelkoong@gmail.com>
In-Reply-To: <20260522205823.1597313-1-joannelkoong@gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Fri, 22 May 2026 14:14:50 -0700
X-Gm-Features: AVHnY4L8CRcCPwymhFrfLUqp_CqmKHf2kaiNJZ2a6hDB9pxqFuRfgJFMfOmV8VQ
Message-ID: <CAJnrk1aV1Z0wBQ=ViTKEsojrVkqaNnpRHiBOqFLRL+QtS2gMPA@mail.gmail.com>
Subject: Re: [PATCH v3 00/10] fuse: add io-uring buffer pools and zero-copy
To: miklos@szeredi.hu
Cc: bernd@bsbernd.com, jlayton@kernel.org, axboe@kernel.dk, 
	fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 22, 2026 at 1:59=E2=80=AFPM Joanne Koong <joannelkoong@gmail.co=
m> wrote:
>
> Changelog
> ---------
> v2: https://lore.kernel.org/linux-fsdevel/20260402162840.2989717-1-joanne=
lkoong@gmail.com/
> v2 -> v3:
> * Rework the uapis to be more ergonomic. Use io-uring registered buffers
>   infrastructure instead of doing pinning logic in fuse. Get rid of heade=
r
>   pinning as that makes no real perf difference
> * Rename from "buffer ring" to buffer pool. Logic is the same, just diffe=
rent
>   naming

Just to reiterate, the logic is the same between this version and the
previous versions. I just renamed it to "buffer pool" to decouple the
implementation detail from the concept since it's uapi facing. The
buffer pool is managed as a buffer ring internally.

Bernd, it would be much appreciated if you could take a look at this
series when you have the time. I'm targeting the June merge window and
the io-uring dependent changes have already been queued up in Jens's
tree since the last merge window.

Thanks,
Joanne
