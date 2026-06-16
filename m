Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB62E429825
	for <fuse-devel@lists.linux.dev>; Tue, 16 Jun 2026 11:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781608026; cv=pass; b=FMX5Kp3I43Qeo3SW7NNwqZugjUJhUMZvSyfcmIRovg0j1I+YT4p1LR7r4aWuyD0+ZxL5b5BC3tkeaJbAqCtHz+qAUQauy/nAu0LcxMNS/K5GqEh/8inQskmOc8Mb8nexaSh6Qay0Zj+aRfIgEFFxiT2MpbpPX3px4BF5qJf8yI8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781608026; c=relaxed/simple;
	bh=UKgvFqDQMLtLEF6PZjpH7+zKeHvR6wY1BelpszDmhso=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eLZ1y844JLkHbc0hn03BsWihI5aVvNq6YBzLh8NoPqsW+VAcRe9Tk0qMf97Ny3093obqsfKtaMD4IbJEP1ISfRgVNgeifYz1pYM9SoHXGokp0cswIFlpLrDkv1C3qn4ps7do1QbI6+Ipg8n2prApb7lpkEfSlmhnvIKaIFtAcBc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D9/QAeLM; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D9/QAeLM"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-68d232e119dso6722476a12.0
        for <fuse-devel@lists.linux.dev>; Tue, 16 Jun 2026 04:07:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781608023; cv=none;
        d=google.com; s=arc-20240605;
        b=jI/37gi2NbB4VTi/lEAsPR0PVCTl2v27CGr+xJhQ+nKLSqmYd60GsACOr4UCb7z0oC
         QrOwiyC4ZVr+Q8eH55NdlXxInu96icTNVd/slM8+EHI+8PVSRqzOaxDuYG8UEMlCso+7
         g5h3Bv29/HTXKEk5bX8Okf+aZCgjotUjAN9JsipgtD90QOwGtXShe8TtJTcZoLlGyIIL
         GesXuEzxLE512qxyWbJJDjUKXAuGYpYpHzPrwqLETEomWkjXlc/tsfapYNgJaEl38uHN
         6iSdYGPjNt7lZMYQPe/53Cgx4RVTXgiiBNEsga7CuIOzsuBcn9lfhplnOB1UksZrks6z
         TyYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=20q/BGHO10i85mG1oAr9AYp71NMXEjLfTQeksDW/K5s=;
        fh=FTKBPjbvyydmWv3/BHLvfAcPZOT0AyLkkKs6g4kll9Q=;
        b=EMY30w942JZ3X6fevgx+mM1V2fYBW1RpEDibVmebiASK+smQPHgOv99ObyWizjB7ZV
         +/c+hQuOPtX8AEoPtbfyrS+Wt54OuX2YpYSb5+dSYNM9btQjWKHOI1z2VweW8z8y0ig5
         Abz1jmOR+8aVj65jo8D/ihhjkKMw5qSCl5arnuoPP4IhHKP7kaDRnvXdu7mh+e4cyJbd
         HpVDdqJ7RmqhwkN5C5n0KGjYDgh9zSBOme0Z6sURodgtpQV1otDGc8iQxxdYhU7nUmP0
         m7AGq2af2v2/TDiwAubXXvUus+rnWN+uInCzL2i233dgdWQJbYsFWD1WGyGFqBEzKNHj
         VroA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781608023; x=1782212823; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=20q/BGHO10i85mG1oAr9AYp71NMXEjLfTQeksDW/K5s=;
        b=D9/QAeLMFYBswgSLo6rGWZ6UPzfJ2QCdK1TpOPC3Q8GbSk3/RJAAJCVTJUB35D2omV
         S9HQiC/iha3aSM141+wYN884CwNKzcJCjIQGavGOvqZ2Xzc1eInfiku82i8WfpX51ldc
         iSEjjafXEMvI0616svcLwsfl8CvLrrvp/7rTAglGB+xW8OtMmGAeLdokwMbniTJjdf2q
         X6bGEFsYKRgrEKwTs5KjKOWRcWqO1Kam3by3m16I3hyOnXFIZ399EW6dPklg4ZNEAiPt
         w5nVhgM4Xg2Mk3S2oJYa0+tOUwbCs+watIKebTcDnTp5sRJDn3ysu2AjanbhqAEuyTe/
         drjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781608023; x=1782212823;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=20q/BGHO10i85mG1oAr9AYp71NMXEjLfTQeksDW/K5s=;
        b=Idk4kKjjFShWAiRAGeQMfeHCZsIXk1F9unGC5s++LBwKL6HUodE0TePExTmPXddUHA
         AMPZIeHiC/SP7ucIH6UiPz9qiVSNeMbj05SO6GiUH4vAOkWlC62AZg+z7b3H3prl6b+J
         aJKZk9iVhTza7kY+JsKR0+ucRFH/tLx6y/SXGWY1f8Ef+PCwRpuI9C+KBg1i68IwtGfl
         UsBlZB88UMHKl2A6NMVmQ1Uz2SxThR39YTgukuGN3N5o0YHbrN3Dbga9g9GnsYj3Kq5P
         62XE+9H+dt92AkJ/cVqnR0FfUaCTwvCCElR5JYHdAqPgaiQDHNBxd/F8TqhOJ8PzIE6A
         z25Q==
X-Forwarded-Encrypted: i=1; AFNElJ86p4Oyv6uD37/KcZbpCRjl8d9rBaYH23gtiRrptkYvRYXZAw+sdJJ4aJTVIlcFfrUUIfPC0blT2zVX@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9IO2KwHhT7PlXSyTzeD1wpGxWLvt6G0bovjp7h+NeJslSONNJ
	qg/U03u7GPTstULw9Ugo8tVZjXH8/itqMUcXQ5fmBYnSRwUC53yVkhmJn1U1UrxIJwpceTmE5kR
	4WStWhxxXTWOuhXm4I3ABVObI9OH/c5Y=
X-Gm-Gg: Acq92OEg1R/64pQt58R8DmCVK3Z4EOLtm7okqJmB3fHkC4ZBtgx9GvOOFDPvN5gEALi
	oN1lRAs2CMvnCbLLEHFsP+L0Dq+lBKjOXflI4BHNPayWxmoPHGW1ip2nUyc0wWgdpW8mvhIwNxe
	ichWRPl8nYgGWfpo8p47XZUqOgWYXCm/hRNRLjoRwBZUEvG5QYFrR4vtnIXoEM8AxmcNS6B4wHe
	6dD889mXP5kvw81s/oQPRi78IJFcK3ynZMtgEMZ2nxALI6K618IPP8qNq3BEFjxzGY+xAMVl68b
	HeJWjpGY+4MzgGT+INtlaOETEL16oezTB3CVbW+Oeg==
X-Received: by 2002:a05:6402:548b:b0:674:40c3:f047 with SMTP id
 4fb4d7f45d1cf-69378a13834mr7848637a12.12.1781608023195; Tue, 16 Jun 2026
 04:07:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260529031918.7361-1-russ.fellows@gmail.com> <20260616014419.7913-1-russ.fellows@gmail.com>
 <20260616014419.7913-2-russ.fellows@gmail.com>
In-Reply-To: <20260616014419.7913-2-russ.fellows@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 16 Jun 2026 13:06:50 +0200
X-Gm-Features: AVVi8CeB0X6EyzK00L2fugoUV9YOSNlq4homkq5QHUNDaYttuIbu1Ks3xO3WC3c
Message-ID: <CAOQ4uxiMEG+wMot+hcL48AoT_FFri=+RimQ2JbLA0Pi77pvzKw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] fuse: preserve FOPEN_PARALLEL_DIRECT_WRITES for
 passthrough opens
To: Russ Fellows <russ.fellows@gmail.com>
Cc: miklos@szeredi.hu, fuse-devel@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Russ Fellows <rfellows@xlrait.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 16, 2026 at 3:44=E2=80=AFAM Russ Fellows <russ.fellows@gmail.co=
m> wrote:
>
> From: Russ Fellows <rfellows@xlrait.dev>
>
> fuse_file_io_open() currently strips FOPEN_PARALLEL_DIRECT_WRITES wheneve=
r FOPEN_DIRECT_IO is absent. That rule is correct for the regular direct-IO=
 path, but it is too strict for passthrough opens.
>
> Passthrough I/O already bypasses the page cache through the backing file,=
 so it does not need FOPEN_DIRECT_IO to preserve direct-I/O semantics. Clea=
ring the parallel-write flag for passthrough opens causes the kernel to dro=
p the server's request for parallel direct writes before the passthrough wr=
ite path ever sees it.
>
> Keep FOPEN_PARALLEL_DIRECT_WRITES for opens that also carry FOPEN_PASSTHR=
OUGH, and continue to clear it for non-passthrough opens that lack FOPEN_DI=
RECT_IO.
>
> This is a prerequisite for passthrough write parallelism: without it, the=
 subsequent shared-lock path never activates.
>
> Signed-off-by: Russ Fellows <rfellows@xlrait.dev>
> ---
>  fs/fuse/iomode.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/fs/fuse/iomode.c b/fs/fuse/iomode.c
> index c99e285f3..0301a48d8 100644
> --- a/fs/fuse/iomode.c
> +++ b/fs/fuse/iomode.c
> @@ -216,9 +216,12 @@ int fuse_file_io_open(struct file *file, struct inod=
e *inode)
>                 goto fail;
>
>         /*
> -        * FOPEN_PARALLEL_DIRECT_WRITES requires FOPEN_DIRECT_IO.
> +        * FOPEN_PARALLEL_DIRECT_WRITES requires FOPEN_DIRECT_IO, except =
for
> +        * passthrough opens which bypass the page cache regardless and d=
o not
> +        * need FOPEN_DIRECT_IO to guarantee direct I/O semantics.

That's a very round about way to say FOPEN_PARALLEL_DIRECT_WRITES requires
open in either direct_io or passthrough mode, but an even better way
of saying this:

#define FOPEN_IOMODE(oflags) ((oflags & (FOPEN_DIRECT_IO | FOPEN_PASSTHROUG=
H))
#define FOPEN_IOMODE_IS_CACHED(oflags) (FOPEN_IOMODE(oflags) =3D=3D 0)
#define FOPEN_IOMODE_IS_DIRECT(oflags) (FOPEN_IOMODE(oflags) & FOPEN_DIRECT=
_IO)
#define FOPEN_IOMODE_IS_PASSTHRPUGH(oflags) (FOPEN_IOMODE(oflags) =3D=3D
FOPEN_PASSTHROUGH)

>          */
> -       if (!(ff->open_flags & FOPEN_DIRECT_IO))
> +       if (!(ff->open_flags & FOPEN_DIRECT_IO) &&
> +           !(ff->open_flags & FOPEN_PASSTHROUGH))

         /* FOPEN_PARALLEL_DIRECT_WRITES is not supported with cached iomod=
e */
          if (FOPEN_IOMODE_IS_CACHED(ff->open_flags))
                  ff->open_flags &=3D ~FOPEN_PARALLEL_DIRECT_WRITES;

...
        if (FOPEN_IOMODE_IS_DIRECT(ff->open_flags))
                return 0;

        if (FOPEN_IOMODE_IS_PASSTHROUGH(ff->open_flags))
                err =3D fuse_file_passthrough_open(inode, file);
        else
                err =3D fuse_file_cached_io_open(inode, ff);

or some variation of this which makes those modes and comments easier
to understand.

Thanks,
Amir.
