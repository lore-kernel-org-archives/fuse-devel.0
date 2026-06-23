Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C1E33B7B91
	for <fuse-devel@lists.linux.dev>; Tue, 23 Jun 2026 22:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782252614; cv=pass; b=fEkS9ucii8w/iGW6D+b/HRO6aeEpJP1pWrZ3JcKJ54cYNnjcg51wUCXBC6N5a2qyMJDJZmRdUmXScjdgwFDSk0fDZX9qdq3sY6KB4W3OEBlI40g5NEthb9H1pIcj+sNxWKRTCIJbYRE8r6zcxhJoxmBP+l0GcotA9g3NbtmoiNg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782252614; c=relaxed/simple;
	bh=LD23bkJImyn20SL0GBFh+Jo0DOAPY219tpwP94ydPt8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rmoHZVbEfKve73QMorEhhNYoUzz0jGtpd6Kcay1a8JztA4FdEX2Ad2skplMI0JxISXkKi6a8mdvJlCTGfj8/srgngnOpmZMStybUuxTEgYbmQNkEg8WfofYhsp5Z3/VBv9vJzRA1EyD3ZBZQdtpIuUufAk7GZ849cAv7pYodc84=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I5MUJ2Rx; arc=pass smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I5MUJ2Rx"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-462342ac290so466479f8f.2
        for <fuse-devel@lists.linux.dev>; Tue, 23 Jun 2026 15:10:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782252612; cv=none;
        d=google.com; s=arc-20240605;
        b=I++NN2vgmdTpRVgwvRwfTOTWRtC3XhkyVEp9UaZQSl3Yy7zwU20etAZSv1NdOwOkLR
         Yb9yLc1DLII5ZmPPpxaWU0fHuzR1CiNSLWAKg27QLSsDWnToRnHhqc43MdU0nh5qhFMH
         iTxRup5pV6StLEbdQCDTxgcjQ5UAZvpXC9jRdeqyeDJTyukGkmmgSn8epzD4RScIRoko
         H7U7uI/0JGFBBwcDzqZHFp8/EF3T/bZ9YKFpgT5kQKMtk4TitWrX7iivrOEvoq7vWnla
         Ju1K6DUVRaUOSJyEIlM5CnrL6rYar+XhW8OCLoPZAOeu2o0+tVw0prnYkVAbartxQRo5
         ojBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LD23bkJImyn20SL0GBFh+Jo0DOAPY219tpwP94ydPt8=;
        fh=IAJHEI9XOqDlcMFUkqJaEJdvFrJXBgvK5p/FGq06d4s=;
        b=ZXr+YGDmK90+KJC800XzdIRLruB1zFhEy6xyWmocI8ZG1V4SO5ByxW6kcEKJlltHii
         GS+ZjnZ40PB1WSSL817aAWBUYt4/y96Pv2947c+NpprIff2eX8y+Ej/4+9fo2uNfDex8
         7JqicGIX/wt2G53eGE+xb30TsiqGUkPrBSogxCjeBuE4CfOaJz9sojZKwXv8Ka2toHPd
         Y/lteeKKnbnJsmqa/v6Voohe4pSxUtFa8nI0v3/r6rcuCneFLGZ33/KoyfwyL1xhwnCB
         xIOnP7HbySbeZ3lW0WrXua/KWIPFxgRGcncQ6KufpIhcWN9aqJlrCoA6feqw79s+vF/n
         OVXg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782252612; x=1782857412; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LD23bkJImyn20SL0GBFh+Jo0DOAPY219tpwP94ydPt8=;
        b=I5MUJ2Rx/rog6fvm8VxEddCBb+HFHmIcvVIq7E5fBjyNQwvHe+qbm1sGjKOjx2fbGU
         mFHTJRLqAIcN/8Od72Vl4Qop74xNkcjN+W4wxfI5r5A+XPwiqX60dTG7cuX0xBVvVXhQ
         pkeilybQr89ViqvQ4vLgOHWR+TCKcSENCBRHsHWeYANNGq7l5p9kvngfdFkenkSlnojd
         eiX0k0YPGHnev4mP+3tezeymMZ3xFXibbjCdUNHqsCvby6BBnY+HjvCHvQKue00lam70
         HL/7c0OhMhyEvFSU36GnXKUp7dhnGUUG+PZHQ61Ix1foAoI7NvUMmlVnsgNHh/T17w6S
         /7lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782252612; x=1782857412;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LD23bkJImyn20SL0GBFh+Jo0DOAPY219tpwP94ydPt8=;
        b=hCFHmt95SFne7lqDvgxlDEvuwfyieNRLU7+nk8GRj7YO82cmsUKi1JKKMfNm75q85e
         vm+Cl4ZEVNyBPYzWq2KN+rZRvVtpXvqoDLsj48JGz7HaF9RZV2u/LyNa6+4/zHYlpgdc
         ihgyUALTIeAfMIl4jguhvmEmwUJGPh9tQoNgIssQ8A9P/y0WPLIdUPmdWx5Ug5u8r8qc
         69ztpQQIiumsE1qswW5c8gn5/ycLvdxhlyxS0MuLLl/qN/PSw7W34o1cFPeLF5eZ7Gr4
         ociY89x87g4QyGNZx7ECz0xkLA3ZYVqdMeg4qyLRlYNUhPeOYKtXizy/EskchfpgBBGI
         wteg==
X-Forwarded-Encrypted: i=1; AHgh+RrRW5fPhwMVFejo8+yj4m2xLTcGamCaFMMmXGDLMbsEauMSuRLU+0+cWUg/5BY/M+qsYBZiR2knCLuy@lists.linux.dev
X-Gm-Message-State: AOJu0YwsHQtDmYWD8Vkf7MZQ0Oo4QGfrib+AymRKPuabOA8k19i2NNt4
	8EEUe6f6tXSt4E0+7FOKJkLdYjeZtQE1PAMSLtmgmEPGI2vDBHInwSCvhLIwR53TWCsBkEjLYGD
	ZOJz0yxP7h22TgNnRdmRVUNBk+IvU0ZsKC8Oed4A=
X-Gm-Gg: AfdE7cnoWiNKS15x+c7pts79JVX55jUE450NaXabnPRsqsHu1h3L6K3WzLvr3htaWF1
	enl5ENfj2reNEqtTJ3AyDC3p0VyTtr4FdSFTwfxx8VE6tZRHZor9onuNwEggyDAMSTfJLlywVih
	MkTwraZbaXbY7udUs3+QuCov068tAqwpnY1Tp3JAWsmaq7VqDPRQ3h0cCT30IQSr9DPklG4FsLb
	bXZV/s8bXUefpOlNAyMEayyywEHw4QTwvsKSfudS4sn1YEOodjGq06Paz0PNBzTOtL57NpItBGg
	qjzl+4AGhYUHNm50F6L+2kswQP5mYTp84g4SkzzjjWohFaHdBbxx
X-Received: by 2002:a5d:6f0f:0:b0:46b:c841:fc8f with SMTP id
 ffacd0b85a97d-46bc841fd53mr2917699f8f.21.1782252611795; Tue, 23 Jun 2026
 15:10:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260529-reduced-nr-ring-queues_3-v5-0-1dc08c2fccf6@bsbernd.com>
 <20260529-reduced-nr-ring-queues_3-v5-4-1dc08c2fccf6@bsbernd.com>
 <CAJnrk1aGcWGJrkAVVEGfjP6mBVraJuQN0_S9oprV6Yo29srBWA@mail.gmail.com>
 <CAJnrk1Z7ECu5vLqnO7ubdkBLZqLB42njaBinqg2LMWpqx=s4Ew@mail.gmail.com> <8568d20e-b00c-4902-a200-024f8cc1feba@bsbernd.com>
In-Reply-To: <8568d20e-b00c-4902-a200-024f8cc1feba@bsbernd.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Tue, 23 Jun 2026 15:10:00 -0700
X-Gm-Features: AVVi8Cd_VqVgmffs6ge9qZzv3aEOqfa-yCFBNfOehEgTDmK-2YKOYhvlW_OYPUE
Message-ID: <CAJnrk1YePZWn5r0b4n3tUEdHgrU47Q-7_OBa9dwXiTMTLJimvA@mail.gmail.com>
Subject: Re: [PATCH v5 4/7] fuse: {io-uring} Allow reduced number of ring queues
To: Bernd Schubert <bernd@bsbernd.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Luis Henriques <luis@igalia.com>, Gang He <dchg2000@gmail.com>, 
	fuse-devel@lists.linux.dev, Bernd Schubert <bschubert@ddn.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 22, 2026 at 4:52=E2=80=AFPM Bernd Schubert <bernd@bsbernd.com> =
wrote:
>
> However, I'm lost about the relation of buf pools. I very much disagree
> that adding buf pools has a relation to queues. Unless you want to make

By "the decoupled queue-creation uapi the bufpool work will use", I am
referring to the new registration flow where queue creation will be
its own cmd, eg server first sends FUSE_IO_URING_CMD_ADD_QUEUE cmd,
then FUSE_IO_URING_CMD_ADD_BUFPOOL cmd if they want to add a bufpool,
then FUSE_IO_URING_REGISTER cmd for registering the ents.

Thanks,
Joanne
