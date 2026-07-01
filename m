Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD9E8376497
	for <fuse-devel@lists.linux.dev>; Wed,  1 Jul 2026 16:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782923748; cv=pass; b=AMG9xVlB3LkeH1OVsCN8oG0UtAtv4vj0mnzyGdDHRGdSBzEAfMOwU7QS/eLsbq1ProxTh5fmSMkNhyHEn43E79VsFeQvxEFimQEOod3EkTt/7ukG4Vw5Lz0mLE5kccj4u631eOE+eKO4RQkIYQDwjBcxgqAteR6kXi7zMeEtrYw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782923748; c=relaxed/simple;
	bh=0P98aBWoQP56zD4RNU27ajn1X3UbShaZBxRYVvAU2j8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZEadxl3UOAAzGgM0fU+7k6m4Wb9eXqgrPs8Gg19qOpuRjyz+F2FlxiqsjDD9XKA0+hGxMsDG2/whSvl3qim0dBOutnDItAUUtI3r4jATeANlEWckXB/ECKg0Zf7A60kyWk+CQaJWB3yJMqrH4Z0G7jbgSS+sj9M0HwYOn9nnFEU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cyjx78IX; arc=pass smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cyjx78IX"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-493a97fad2fso7445805e9.0
        for <fuse-devel@lists.linux.dev>; Wed, 01 Jul 2026 09:35:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782923743; cv=none;
        d=google.com; s=arc-20260327;
        b=dGNZsxiSIs8sM+ya134n9Se8acZGz70qG8tWCfNm8hhFsffJbtMbjE/V9TGX+jeIqe
         3e7jM0MKAaggbTo3f0WnvAx/fu+KcXYR9BI/BzRX2+ExmIVc9ajm5qnakZUzaTSZDKLP
         z4l/dC7SLq1LswdE9Lofy1dy1kScHs0b0NmOW3NkJ+l1L/74C1bVZRO5S6+4zIeDD4Eg
         iIqpVx02DG32fKi8vyZ65Vg2IR8yOThYAtVrnrb71ztOuj41WcxIaoNBZX3IKKLMw/Dd
         mlwAlxHyWZa/yEPvC1qsYmrGKjnAcNYd2w0nE8o3sn7Om1r4AKLenTJprUfNG7UuESaV
         mH6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PL5oGccrBJjauLUKKFCufy5yc8f9FeQTdOQ8dsLHDeU=;
        fh=uL2cVaw+Mm1SbEnyYO+R2Eq4fbbw2yeyzizDWWTHJao=;
        b=VCo1xudDZ3leAHf9SsyE2hKlJ6UK095k6vfAZ8JUfJ+QcjbckIxTeWnXDH1CJmOTVJ
         rF2ms1KhgrepvS9H/gtjSxAkuXnteuBnNkY3HNlPgHEIDgCgKnHr/0I55vL7uJNVNsUu
         GRQUf/7KTD1iCGz0WxvqOvEfIbBDBHIUgVO6j5VVDpIJRsn0/rRY4FLx5VUqH4Hfd3aD
         F26yc27McPiXi9ryk9JCf9GZVDW3G84Qn3FdM2tfoqNBniwmhB1bsNwNNk5JWpmXv+Yc
         /JLyKL2ft02n+FSpUMQSf9MMCun2jhGMU91p7EUpqgHgzr7XOyQUSfaLsCMaZye9v1jq
         gQtg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782923743; x=1783528543; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PL5oGccrBJjauLUKKFCufy5yc8f9FeQTdOQ8dsLHDeU=;
        b=cyjx78IXd3xpjJMHygH0AxdoOc9VskuFTHH/7SOqLPnexuwq5WJ6Q254UAFsrlfUMr
         khzu0lII+wIpcJHRDNxicznOg2qithqNKkmjvq24Y7zk8Ya9qHuFOEmSoVu/LpBxbGOk
         3ahlSd9y7Y1Y7c00X8uWKiPk3AezjfQh+9sV+Shlvxe4B+AEh+AZbRk23OEvqPmUuqqt
         TGCacHVEtiA9t/0QGDzJl9wIDo91Cei303kJG7yQC8z+h2akCT+IgLVeiaGg66VbR9SE
         pheOgqvyT12N7Mu13GzAFBE41Bpbr23NwrAhodOJ+nDw0H6x6Kbv5AecQ2tufCQ5+gvY
         IyNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782923743; x=1783528543;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PL5oGccrBJjauLUKKFCufy5yc8f9FeQTdOQ8dsLHDeU=;
        b=qGt8uYP8T93xrWhuuFhhUcA/OtobQVYlSdz3ptw+lDcxUPCE/ETPKI3/k21X/bxAXA
         WKxL1bPZkijGOg/HxugvFjRbpt9NlkOg+kQw3BJfaavCydcHcAwByYzuJvFaJbBKjAfc
         9tBwsC06qY6AsB4sIPQQMjX+X4fwhR81FEcDTgv24FchfO1YDjErNOhUIDwn7s4Dltq5
         JzHEm4/4hSnX6S3cdIenM84SHueQ5rhubznYUvz6nObls2klQl9E4KEzzaZpszHfHHH6
         KVos45SV9dIO95h+BL5SvZjX0X237dbY0yx0gXrkjblXpAHztBGeRWFYPy9wfuKmo+zw
         i4xw==
X-Forwarded-Encrypted: i=1; AFNElJ/xGBT1Qk4NJtFsnVCoJNyIDi77ku4NbPKamyyKou9j9rACiaX1zmUUsdPMt5sQihndenx67B4RaZKB@lists.linux.dev
X-Gm-Message-State: AOJu0YylTWNbJgbXlaqKWHc7p+lDKoDESzngt1HrWmkan5qtw2mF8P1M
	duQVPsF5UhBNiIcCJoM1LUbh1A94lNz3lOLXCqW34KrlckJdlcV4S9snSYiM6w2lEQ/BQT+QuRY
	67/f0pIhN6tzieuMQpr9LairpdfZKPdY=
X-Gm-Gg: AfdE7ckqo9EeybzN90SNwfELOtaP1Q6GKIi3Kzn1K/kJ5/Jev8mp0Yhy0LnOU6Sdz8o
	2N6HV8quEExZsCT8qG3sLytRXLHeTZ9HQBZwoom6JJQmKl5VCXdI7Knt8g+yC18VP06lIkNtTQC
	zDiCmboNM6uc+3BdjfFJSlRmBYVKlwM1i+nwakQQMPIx6fAcia/pika1WjgLEwVwZrwHp/CU1DH
	Kq34vi7R0JwtJzV8ZKWVWfhcZxuBF+YZJAQgrKXb5mmJmY3WxT2PWQTiauRSxtFqwEXBHrnezAq
	8FviUNrdlx/DQCaOxTN7Of4SsAAWZPih12NH4qCETEVQhDY2Wpk1
X-Received: by 2002:a05:600c:5808:b0:492:28be:6098 with SMTP id
 5b1f17b1804b1-493c3cd9a79mr15611415e9.11.1782923742496; Wed, 01 Jul 2026
 09:35:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260630211436.2062816-1-joannelkoong@gmail.com>
 <20260630211436.2062816-7-joannelkoong@gmail.com> <CAOQ4uxj8RU8X0V3+74rw9wjBc2w2TH8qaGXgLq6DdjPuQ8tivg@mail.gmail.com>
In-Reply-To: <CAOQ4uxj8RU8X0V3+74rw9wjBc2w2TH8qaGXgLq6DdjPuQ8tivg@mail.gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Wed, 1 Jul 2026 09:35:29 -0700
X-Gm-Features: AVVi8Ce2IOu0dDhQqwv3cugpUilG89bISTqMXfZ7hNYSxzCn_hvZPXxcAb4qMD8
Message-ID: <CAJnrk1YT+a-NJ3H8rGziAPb9QL5-Qa4A-ojLmz8jSmWKPoJEnw@mail.gmail.com>
Subject: Re: [PATCH v5 6/6] docs: fuse: document io-uring buffer pool and
 zero-copy uapi
To: Amir Goldstein <amir73il@gmail.com>
Cc: miklos@szeredi.hu, jlayton@kernel.org, libaokun@linux.alibaba.com, 
	axboe@kernel.dk, bernd@bsbernd.com, fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 1, 2026 at 4:56=E2=80=AFAM Amir Goldstein <amir73il@gmail.com> =
wrote:
>
> On Tue, Jun 30, 2026 at 11:17=E2=80=AFPM Joanne Koong <joannelkoong@gmail=
.com> wrote:
> >
> > Add documentation for fuse over io-uring usage of buffer pools and
> > zero-copy.
> >
> > Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
> > ---
> >  .../filesystems/fuse/fuse-io-uring.rst        |   5 +-
> >  Documentation/filesystems/fuse/index.rst      |   1 +
> >  .../filesystems/fuse/uapi/io-uring.rst        | 143 ++++++++++++++++++
> >  3 files changed, 148 insertions(+), 1 deletion(-)
> >  create mode 100644 Documentation/filesystems/fuse/uapi/io-uring.rst
> >
> > diff --git a/Documentation/filesystems/fuse/fuse-io-uring.rst b/Documen=
tation/filesystems/fuse/fuse-io-uring.rst
> > index d73dd0dbd238..a92dee057d78 100644
> > --- a/Documentation/filesystems/fuse/fuse-io-uring.rst
> > +++ b/Documentation/filesystems/fuse/fuse-io-uring.rst
> > @@ -95,5 +95,8 @@ Sending requests with CQEs
> >   |    <fuse_unlink()                         |
> >   |  <sys_unlink()                            |
> >
> > -
> > +Buffer pools and zero-copy
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> > +For the userspace protocol used to set up buffer pools and zero-copy, =
see
> > +Documentation/filesystems/fuse/uapi/io-uring.rst.
>
> This dereference is not clear to me.
>
> The name of the suggested doc is even more puzzling for me
> io-uring.rst is really not an adequest standalone name for this doc
> and fuse/uapi path is unconventional in Documentation.
> The doc is not even pure uapi, it explains about buffer pools and zero co=
py.
>
> Why not include the details inline in fuse-io-uring.rst?
> It's not going to be a huge doc and all details seem to be intertwined.

The details were originally in fuse-io-uring.rst but I think Miklos
preferred having a separate fuse/uapi directory [1] for how userspace
interacts with it.

I'm happy to change the name of the suggested doc - is there an
alternative name you'd prefer more? How do you suggest making the
dereference clearer?

Thanks,
Joanne

[1] https://lore.kernel.org/fuse-devel/CAJfpegt8sfO681aoixfCc2XvUP-OH50GVHG=
-vmF8Q3oGqxF9MA@mail.gmail.com/#t
