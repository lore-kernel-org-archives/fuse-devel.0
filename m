Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55FFF3D7D61
	for <fuse-devel@lists.linux.dev>; Mon,  8 Jun 2026 17:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780939705; cv=pass; b=kBo80f8N+iQBkuiMk+P5Qcese1ix9T+D6aeC2R3z4ix7twRTD+n2ztSxU7Fbn9JwWMqToyy8MuYF8KyiM4xukRXyjAt+qsyXWRd/eR7TIeq6gcAyrpI6L3LE8nQiFc62Qi3JYW7qSmYU1J1WFkn2nZtoVCKIdxprnFa55hxg6GM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780939705; c=relaxed/simple;
	bh=cowmi3+ykQJgNo3AqI6VXQ21WVCN8gyxHrZRNzzg/dQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uXXlpa49kuKhxdExgWTzFZapNUX+ARciR7PwxMIP0+fx2TOUafUIUk/QwS4GmNZ3QOaBHzUpSZr0FJjbyl0zc8SmpPJ4/mJ3bpZbknsVtffhJ+Aa6qkifNMkGKCODh4lpYarXZYd18njTtbVB3LJIwaxLqGz7Up78pPSYUFCxUE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=ZOz5u+OB; arc=pass smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="ZOz5u+OB"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-5178a42caa3so44652191cf.1
        for <fuse-devel@lists.linux.dev>; Mon, 08 Jun 2026 10:28:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780939701; cv=none;
        d=google.com; s=arc-20240605;
        b=WDEumOUwNAxYlFO+9bqDn8hGBZCu3/yVzNVJ8BnyaPpu07wtGz3MuYtgVKXvLMJwNU
         N0j7RFAQruuMgtLA0CQgZNQ0mvyRAW7F4qjWWDeSSFubb/UHt4Y/MMFkxcVp7/e3YK5H
         gDZgYDPMUfI6ezl7J0TfbxHu259mvKfaOJdYjf1D/KkCvrVWES7+FkGKo3mUL/05DIt+
         c1quP9Rb7vintOGy7PwzgHWRuNQODl4A1qfbmmVaCygrzoyl2vKZkTlq5sA0Ebw+79EO
         6tkeBeN8c38AJG7y+JreInpf1da0UsJeztFLqyvCpT2/S1VyJsUw66WUh5DyO/G2Gr90
         MyVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=d7U4zc/LNIPR/5rhjvkAHPlVmeHUKWR3UtKoj1Vq7Wo=;
        fh=jjjBLAQ4CvU7y5rowrqvimnCqU2LCM9IFa/jj1BYHl0=;
        b=hUnkVhY3AFYXiihSCUPgOwGCWcmX7dxUrHVsweK6Og5ei2Mh4IrDTRSPGSx1sGF4Jr
         NCq3nhIz4oI028VSGaUlfKaz658LAWt9+nZzr4iNF0EaHJtXqrE+uAFsr6RY0+9RwvLM
         DHPjo/+6lvTxJl8PXcIZDOkDA+R4fKPDLadkHwh3tu8RyLt+/eGLB0Y9Rsm+Kgt+onyc
         8oBQ/izgCySR6ErbG1ZSxlTwx0xK0IB2vYnSV4/yM8GDiG6ELtY5v5g+R1bWLGw0aQc3
         Fhu48Mof18G5/sKarNqce7NC0TdK1LaOjaAlWP5JWzZ5+ZXNMURnYal6D4YFWAPFSxNF
         qC6g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1780939701; x=1781544501; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=d7U4zc/LNIPR/5rhjvkAHPlVmeHUKWR3UtKoj1Vq7Wo=;
        b=ZOz5u+OBOoKe2eurk52JHt3O+OlaImJRXKczzF7IsdaIRhI1g7JgVZdSipRNvAwkNH
         5oOe7nsk9LSBilj6N+eWFaOF8C9hW+W2yq6BlDIJI/IkXuo0SoqZXg2qYj8VkOnZ/e1I
         aMQMTYZX0rdxGX0Ry7Z95C7RgHskhMU0Pugz4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780939701; x=1781544501;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d7U4zc/LNIPR/5rhjvkAHPlVmeHUKWR3UtKoj1Vq7Wo=;
        b=HE9SC8aSHN/R/YR42TT9dNogal7SFWBz4f3BE/zXVdy6eqLM3MFeh3z99TTQ0PXi2u
         C/bb7zCy7VPgkioiUpg5FymugNPijET9+M3mNV9uqQlO9g/mZrvU9P82wO1uQEXJt/Ug
         cselhveJfQun1iucbAcREc86lC3+EgiLTahlXFn6D5xd/KwdMPz1/jnn4PH1hr02G9C1
         3tbtlQbqS0UpEP9wcXrH5ovdENA7SnD64LjAvwjtGQ9Oc+SOSwoLnLXqXMwv00u9+AHK
         frH8/fH/MnYL4U2PW73Kr2wVFXl4dhKm9OvxEaBqpse79ssam2ndznTg0ryKpZaxGcJ3
         ve/g==
X-Forwarded-Encrypted: i=1; AFNElJ/7/cPGqa63C7ZaxBiK3iSw2IjcviFyB9WgT2MS7kd7CnTG38548UqWITKhuaHacLeTJlt32XIbPq5F@lists.linux.dev
X-Gm-Message-State: AOJu0YzdHLmeaLowdrmQqpnm0Hc3GuigUTBtn3cu+im36gc3FJZ+aETY
	Sv4v0cMBt+HTDSgTtOiJ+Vwec3TdIebaEouFDfr9pTeFzcMKVVqRuzk8AQpFLau/smgyB/E8iu4
	vpzkOXwXN7xPx/KusTUWe8vZlZv3NlSWQhm73sIEO3A==
X-Gm-Gg: Acq92OF+NUP4AsAuUeE+C1jdoiukzoSLJd5alzI4pPWaOSsXF7uAAiacICcwSMrth98
	sOy0IkVIMTeKWBJk6sRajMqXYs8AFDC7RR14kDDjyWWiSAUgNcp19J1Rmz18XOA1q/LG6p08j9G
	lkTb4gaTpmAutoRypnOKxz2/WqdpoLEhup4ld+WhRWVSPDw6B9KxJ9NDD2zpIwfbnUf3+RmTPF3
	A+WI97gIix5TW0WbruhDiTkrWU1745mqvBsY6ecHWddVV1CT7muJRQINm5orLt3nstoh0wqkZGQ
	vpOHTs8YoqnYTjOEHcUvzKAcR6CPzWac+tZkfd5/mWwmHuA=
X-Received: by 2002:a05:622a:4807:b0:517:9399:fa83 with SMTP id
 d75a77b69052e-5179888bf12mr166237831cf.27.1780939701082; Mon, 08 Jun 2026
 10:28:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260605192708.141921-1-joannelkoong@gmail.com> <20260605192708.141921-2-joannelkoong@gmail.com>
In-Reply-To: <20260605192708.141921-2-joannelkoong@gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Mon, 8 Jun 2026 19:28:09 +0200
X-Gm-Features: AVVi8Ceqjpew3fq2St36JCFFgclYbphPBawkkcd3WN0vlnMKQ0jF2eUj0qJh4vY
Message-ID: <CAJfpeguuR+K1r0SVNScjkSnjt3SF+E7V8PbSB3TgEVEhK-bLNA@mail.gmail.com>
Subject: Re: [PATCH 1/3] fuse: fix EFAULT clobber in fuse_uring_commit
To: Joanne Koong <joannelkoong@gmail.com>
Cc: bernd@bsbernd.com, fuse-devel@lists.linux.dev, Chris Mason <clm@meta.com>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 5 Jun 2026 at 21:27, Joanne Koong <joannelkoong@gmail.com> wrote:
>
> From: Chris Mason <clm@meta.com>
>
> copy_from_user() returns the number of bytes not copied as an unsigned
> residual on failure (1..sizeof(struct fuse_out_header)). fuse_uring_commit
> stores that residual in ssize_t err, sets req->out.h.error to -EFAULT,
> then jumps to out: with err still holding the positive residual.
>
>     err = copy_from_user(&req->out.h, &ent->headers->in_out,
>                          sizeof(req->out.h));
>     if (err) {
>         req->out.h.error = -EFAULT;
>         goto out;          /* err is the positive residual */
>     }
>     ...
>     out:
>         fuse_uring_req_end(ent, req, err);
>
> fuse_uring_req_end() then runs
>
>     if (error)
>         req->out.h.error = error;
>
> which overwrites the just-assigned -EFAULT with the positive residual.
> FUSE callers such as fuse_simple_request() test err < 0 to detect
> failure, so the positive value is interpreted as success and the
> caller proceeds with an uninitialised or partial req->out.args.
>
> Fix by assigning err = -EFAULT in the failure branch before jumping
> to out, so fuse_uring_req_end() receives a negative errno and sets
> req->out.h.error to -EFAULT.
>
> Fixes: c090c8abae4b ("fuse: Add io-uring sqe commit and fetch support")
> Cc: stable@vger.kernel.org
> Reviewed-by: Joanne Koong <joannelkoong@gmail.com>
> Assisted-by: kres (claude-opus-4-7)
> Signed-off-by: Chris Mason <clm@meta.com>

Applied, thanks.

Miklos
