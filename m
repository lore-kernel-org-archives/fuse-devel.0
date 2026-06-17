Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE9730FC1A
	for <fuse-devel@lists.linux.dev>; Wed, 17 Jun 2026 13:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781703579; cv=pass; b=VfTFN99GA8WNyS/9oduEFY7Z3KFrvKQM03HqOLnuneb9BdUPrmI9d4uD9K+dLgJQk2MM38k0anaU9MvLajMCUvNBGd8/qUiN2NQvRURqEHrjs0M3yyIjseF+q+BJE1SRacuc29dnfqbqiSLXzWhzGqS3A27mBIy+FJkncL+o74g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781703579; c=relaxed/simple;
	bh=c3xewMDd2ASD9ODfQTPkB6kGdjcrp5We4edlhEwNJP4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H142IYRFf6oNdaZ/MpXpFUOfamuggsHDnGCaY1Kr/DKXhy4tXu6LGSOpAO+/nyZPquBarS6C4X/UH+1HaCq82g+y6X1qJ0QO0h/ICjGPWqQrseHkKPy+RCHfuZsMxk4CkSHprkiASVpVFIEqTfgKpqt96gzHvmO8CxAFPzPtzqU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mXnx18Bp; arc=pass smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mXnx18Bp"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-462342ac290so1133310f8f.2
        for <fuse-devel@lists.linux.dev>; Wed, 17 Jun 2026 06:39:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781703577; cv=none;
        d=google.com; s=arc-20240605;
        b=QxLVdQp1NirhgCobVwBucpoidd9L7KFRiQvzBOcj7io2j52PQdwNfjodaU8GG0MA+Y
         EKFvh6IrvHTUYKuEOrEYgVPvAzDnfvMOFhqOWb2v4G36MzSg4CwDVMTFUt8MjzIY5WwL
         /CNL2Fh+PiCzmEx6lObGAz+aISGVeFqW+k/d3mF+S1bTlzGGQwOMLmfctPSeCM+zgqYW
         IotmG2Nks4InZNnQd2GtcNS7RYaaCRHzoGrL/nu745rxzAEV747a7JE0v8q432GNss6U
         ODVQR0WCR9pMJEtoPPzjMLLOL63Rz5LkVNvYcy9uhtr+iadB60CjbfQYvrSxaNfM0jmF
         WFMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eUMzpz/lXkoHEzQ9GeUuLE7VjwybxAwudZlI2/qprao=;
        fh=8bUFTemOwDoWiOdOkdFFPfADoT45yqq3f7053C+zN1s=;
        b=EaFdidFeKGTkz1+FdMz5YiI+kgS1K2qhB5EIMLYnGbu3xPhqQxvBy+s0SEllUedV1x
         +eWhsIHELZTmE+M1J0UnK8gKoYZP4CYtY1NIDCdURppPMJ5yJnkt2VX9GdeM+4gF1euz
         3ugMahHEsUlLxz59Hxjwp+Sl8yjiAq/tuZlgQrx7rJ1NJ6JP0btoS/lcdXxG6r7m6nHL
         2DTghOMwZ2sHWsarrUC8ChpaK75btpNLR3ZVT3a2y0rQV4JZdaMaAbXqyzGd4VVWxWxk
         ulfrRF7ZbuIkYWOiV4wTkhLvwcfjusVr4iStrmjRa+dL4+HttE7Jdk7G5+/CssJS0Gjq
         JwcA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781703577; x=1782308377; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eUMzpz/lXkoHEzQ9GeUuLE7VjwybxAwudZlI2/qprao=;
        b=mXnx18Bp6T4FJvHjov8mnZ+UWQXDS3G6FG/jjD1eXcoXInpffJVj0RZzla8dDhP753
         NvTvygrzNeQVbhqlq/i0n7lkE9IEX/YsfLRtUREDDYeS6EZNctcjvBd5Yj78TL3H8G+Z
         hThQKppNglWkY6KQjTLoGQAzz1/nDf4aRoKZpbMO+1/zuc0HIQbKEK5vkNYY6unVyYWP
         cWfbCET2/C4kKTM5b9yRKclKJ1Pmwor1xGDxR/58mcX7l3MeC0v0RC2YQlFKaK76v/6V
         rKCCMR98hypxMf6kL4ddCcVcwPfX/vXx7UwSbdCm1Q3p2Hf5gGpW/dB40yIjgiB3JQjw
         2dxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781703577; x=1782308377;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eUMzpz/lXkoHEzQ9GeUuLE7VjwybxAwudZlI2/qprao=;
        b=CvydX5hagt2rmx+GhYNigVdbMjG2xdqxD7jG8TSwvOuh0quO7XeKtIFD443aTlMtB0
         f5QKjEdO/pjMrwyv12+c6NllbKtRgAupobpyVfWLyC2JmYi7d/rZZfquGXiRyPJP4pZu
         MFYZSdlE2bT7qdDUc48SM5Ro8Cpc7kLxJiEVojvO8h04BGrFlBgWn/6hcMlA9YG8Jf62
         yxv9YdGS3v2gxogc3ZNPNDkDwZ/BgBj5UeiEwZ4v9YhsOFakbORi2K6sgjKPGJy//e1Y
         6akrNjvwoLeF3sP58lyNTlh4yZlt8JS1/gNP9IIKTxUkbls60AROW1bIKU0J1Qwh6yjK
         CBxA==
X-Gm-Message-State: AOJu0Yx6Y6dhrwKQxtVl2a0O9QeLl0CqF2z91k9bJb4lb4uwHr9vAwjQ
	yWTMrbxpPYjRd3gKIdKgX0ojd9x1d7vvHHnCH2n8KeDZslnqDPqfOlPr5hb/1THiWXgmn2ICmyq
	i+fxDReMjnAJiKvnPYfbbrvC5l00z4XQ=
X-Gm-Gg: AfdE7cmoyuNnjR0AObB4NG/gmT/ldE/GAqXMnk160nbvrnYilAfBHxdjwRN5+dW4zq3
	SdEEmyKaRhBK2B1zPiWcxpkJ4VUO+fESZ+yNlNHgLkTep89Y6Fj1VdbCwN2NrgJLkJCEwKXAXJc
	Qd+n42IYBzusnxmnj/I4FqhV/HifI4bKxk4lpuET4Ny5xAl2Y+aYIE1Xyl2ZQ8jiqj+COBHLSCc
	Y7weMKPoKTrrzZgjnmflOdYdX8mnJjpBY0iLmmvEQHMCKsXkKP824Z/UpzYr/wy5thwEXtz7TMQ
	rcBYXmaVCDtNbNoPHUXFGEf5n8FLtqVcBmIPgH/0k1c/odtGXTVOzhDI
X-Received: by 2002:a5d:6f1e:0:b0:45e:ec27:b4b0 with SMTP id
 ffacd0b85a97d-4623f8b42a5mr6203211f8f.18.1781703576762; Wed, 17 Jun 2026
 06:39:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260612210513.1516038-1-joannelkoong@gmail.com>
 <20260612210513.1516038-10-joannelkoong@gmail.com> <CAJfpegs+EY+eCDOkBgVWhUyd8hBLE3bFY2oaum-k_tS=Cv2SVQ@mail.gmail.com>
 <CAJnrk1YiUn3JFZCEe5oADyK5+zx6Rh_6KTZbCzeHUjAebUVQBw@mail.gmail.com>
 <CAJfpegvokfiN4b1tEd+fAPfO8n9hSQKeXt6-UM1OzxwHYA5-hw@mail.gmail.com>
 <CAJnrk1ZTOcAP85qYpFz6w2TPBK+WMdT1B01T5O_gL68BYAOvCQ@mail.gmail.com>
 <CAJfpegsixwxHLTMhz6uH=ssvETM4zZOS24x5qUM8fvBHTE7Zrg@mail.gmail.com>
 <CAJnrk1afks6eorKTSm__CBMhPcg8v1Cf0gFPVnFDWmfBKMBaew@mail.gmail.com> <CAJfpegtzu-M7+u29_Ck1hGHxDQiQPiz1uqOBs_QkCjSGtjMm9Q@mail.gmail.com>
In-Reply-To: <CAJfpegtzu-M7+u29_Ck1hGHxDQiQPiz1uqOBs_QkCjSGtjMm9Q@mail.gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Wed, 17 Jun 2026 09:39:24 -0400
X-Gm-Features: AVVi8CcdcGOzBJ6JkDWwBuL27WaKQQqc0C9LNcMPe0Ccbize-oapGpApKz_Y0aU
Message-ID: <CAJnrk1b4DRgf4kxbZfi3e5ntHxKDgiZMiVNFR26ps1N3QPzpbQ@mail.gmail.com>
Subject: Re: [PATCH v4 09/10] fuse: add zero-copy over io-uring
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: fuse-devel@lists.linux.dev, axboe@kernel.dk, jlayton@kernel.org, 
	libaokun@linux.alibaba.com, bernd@bsbernd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 17, 2026 at 8:52=E2=80=AFAM Miklos Szeredi <miklos@szeredi.hu> =
wrote:
>
> On Wed, 17 Jun 2026 at 14:17, Joanne Koong <joannelkoong@gmail.com> wrote=
:
>
> > For plain (non-zero-copied) registered buffers, the fuse server would
> > still need to pass in the starting address of the buffer pool, so I
>
> Why?  The kernel couldn't care less about the userspace address at
> that point, it's literally just using the stored and supplied uaddr's
> to calculate the offset into the buffer.

Agreed, but I don't think this is how it's currently supported on the
io-uring side in the kernel. There would need to be added support for
this in the kernel uapi.

>
> Adding a flag to the _FIXED op to indicate that the offset is being
> supplied in place of the address should allow unconditionally passing
> the offset to these ops.

Oh, I thought the issue from your first message about the liburing api
was that offset gets passed in via the "address" arg? For the existing
kernel IORING_OP_READ_FIXED op, "addr" is already interpreted as an
"offset" for pages that were kernel-supplied into the registered
buffer, so I don't think it'd be inconsistent to also allow plain
registered buffers to do that too.

Thanks,
Joanne

>
> Thanks,
> Miklos
