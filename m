Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC962F39B5
	for <fuse-devel@lists.linux.dev>; Mon,  8 Jun 2026 18:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780943726; cv=pass; b=SoB6BKsDSFx+UwaPaell81E9Xcxtabm+zONTROtF/rlxbe1B1LM+ZsfdLwtmTpDzB8ZFsY8W3up4jLOT+MVikY+Uk0msyLQGIPM3mnw18rkqMsXceTrO1rLqWYo8kmWYgeALGE66ZIM3wowgio/lzZKQttkgSVw3Xo7m2tdEnus=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780943726; c=relaxed/simple;
	bh=LJ0d7wJLEsKMYp2wDMzzqU/753oArVGJUs6SgvTaVUI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BDlcHjMzd+SWuCPLQ7X4LUB9MChYljhSHtD5l75EH/M6UQ/hjGSe9amvqfJFv6SBnIScEB+VQiPG8IcGTSbv3ICiPgMbaSMFJ8Nekv0b/B0pOTmBJwIVDP6Lscr4zU4QxmKbv61yeIRAZjZ4EML/zbqY4JEQgx7tSIhdEjm9ASw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k9qfU900; arc=pass smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k9qfU900"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-45eeba68948so3323673f8f.1
        for <fuse-devel@lists.linux.dev>; Mon, 08 Jun 2026 11:35:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780943724; cv=none;
        d=google.com; s=arc-20240605;
        b=QyjpTNbrg0rQlOp3aSSfkorHUXb4P5BebvDYlnWzRvv8Xf2A58NnSOjAmBzFxy/qNu
         e1U772c43Bp4ZvhjXw4HemNUsorWwb29biO/UzC/jR6hmkpcjGgh+5jpjI/aQvtyKYYX
         xBXgX7JESKb0xTOq0jUhY97T9cAGsDOv+2csql03M7fMGU6l/ms8G05P1o2wsqamfWiT
         aB89DjPWEWYA6lWviCkzNxOARWhAFBMsjd5wq4J3l9JyU02AxVcxjFXyvE0Y9eK4hDzW
         k4MApkSUqhQTWp2TmhBYOYn9OYEm6/Lg3IO8fdTlU6FoWbQLaydSRjD6SaTIcKErV8Xh
         dYMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LJ0d7wJLEsKMYp2wDMzzqU/753oArVGJUs6SgvTaVUI=;
        fh=c+KMFAow7tJPDLwZFCvOsIfTAgEYzuQioe8uOeHfNEk=;
        b=jit8yyMuT4c3SgHSB1BK1VfnzXHJfu6c09HDqjxE0cPKOg2a29ei2Jgg2S2cWIscVG
         EUuzQIpz1iYdTo5T9D1YnriiQcab09xcPvAi4iOOfBS1QpsNU7ZIWuUscKyr5YDxENoF
         f/ArLOcv+4kBWMgSbBdOkTasAMqaeN5tmNme9o2SAZ/6dlJ/+HawXfa6sQ0I9PZx/gle
         ITDb8vAlbnDEmRAkABcAoXVj0vRj+MLavptaKDg1cBJqRz8qpAQ5nM2uQB/1zo5GSjWk
         cIDcDRNawpVX0reLmxpSWZAbh4sYWwLuUDpL8os7KPOvxjKD+PGnbSzt3Acm3KFKlCrr
         /wQQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780943724; x=1781548524; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LJ0d7wJLEsKMYp2wDMzzqU/753oArVGJUs6SgvTaVUI=;
        b=k9qfU900JE8XdwhKT1aydDGFFrCQPZ/bpOBwWJAAB7c4hvtfay0nkkLK11j+d2no3F
         Uk26EQMTi+AtUd5r2107Z2bHcIDp3FAIiC6jO9izQ5VmWBkIAjs8HGFGkBTbolnKZiQy
         Hd1nOVCp75GlubwuUfm7OVrEZbJJC3kWVsfcB6u48EeAHfjZz4IEu71VpXOt5KrcrNP5
         6S9KkD/AlrdazhFEhtF/X6mL76t4a76Tg0erTpFNeSOr/esLgLSaJFj6ZIHHI9SH2O0W
         dRz5Yrirb0nqiwjN8fHYEnGFdpENSEqwDDhuEEgIXenWzOHsF+aGYNZcexVIuLjlN131
         wzpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780943724; x=1781548524;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LJ0d7wJLEsKMYp2wDMzzqU/753oArVGJUs6SgvTaVUI=;
        b=RUp5pKuLaTM0+mjxCf091uFbVRztRhz2REbgbR+2BDCkcLEOX+A5o8gxIAyLqI5YK9
         BzbDAUh8S+MLD2a6gD0BktcDjDcFHoGsf905ZTFY3ths3NxsaasO8xnJLrAq/NGKZBPE
         srlgsO8Zoyc/f2GTDB2obPBQ7YdX9CnVCnf4AFK1UGEIq9pKAxC6gjrF93JiH5BW+hRL
         bGoFvgqeNF1/NLhHESInBWmw9zOKBbn+RMEDU4qMpcaY7SGd/Z8fENJGb8qpTrOliwhJ
         6ZdvkQuAjoztMRq1TuKgblOQg+G5lQk6oY+ea4ByVcEckqbjGpQGDiNxPl/6QseIcuQF
         fdnA==
X-Forwarded-Encrypted: i=1; AFNElJ/29E4gn6lxcJn22hjSPufyOj+ljsIodK+Ur/arP4/ggECFQ19TLruVIf/tYO3AZjQ+b4X8aDE/VYod@lists.linux.dev
X-Gm-Message-State: AOJu0Yyxki6vybtVYZBJhNh6Kzfr8INNycSQxebXi9hidd+ZidnPmApY
	CpzRKP2IQiKPu2I7MjiMWsU8aQlMSwQ0a4M9l/NRROetjmVQIUK3/m48d21Rci1HSyusQ2lTzuw
	+Uarg9pRtYxPtM2dO2T2jj0F4fd8w+6g=
X-Gm-Gg: Acq92OF/OickmwWS9hJIyPblnDDPC/hGwRaZxh9jQfcp2LSoSXE2xZ+delswFmaE31R
	6gxWXgc+LOBPA8zgbUUOJIVRRBBl+1DQiV/dkAl37+1YyrOp1HP+YzEIbjprO/cq72SrtBGpkVi
	gGWrs22CTuu5CCsMI/yK49/eEsIhJ2DA31eGHX5hyQTrIvNFV0dISF+LoljwNPQyxQeAmYKoE8f
	9y+yunWEhTVUw46HP2WSCKJioofbqtzXgSAeeRR5fzLD9tFlHF55zJpXd9kmOBT+QqKzfaUByTk
	p8qOU6wVMCzPwUAA
X-Received: by 2002:a5d:4521:0:b0:45e:ebe5:2010 with SMTP id
 ffacd0b85a97d-46030619dafmr19903232f8f.33.1780943723764; Mon, 08 Jun 2026
 11:35:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260605192708.141921-1-joannelkoong@gmail.com>
 <20260605192708.141921-4-joannelkoong@gmail.com> <058fd2d4-3ba4-46e5-9107-3a7e0ab66653@bsbernd.com>
 <CAJnrk1YHQEtpwA-ForFWXsLntc950ekqAHg=L9VExVfJ2WF1Rw@mail.gmail.com>
 <742e68e6-c456-4655-a441-aaa8267f1a48@bsbernd.com> <CAJnrk1bz=BHryaWkZ0uBCpzLoVM-FSsb4mhA8F7+fnMQ4Tt_YQ@mail.gmail.com>
 <57fdff56-6a4b-4bbd-b191-d63b82a14509@bsbernd.com>
In-Reply-To: <57fdff56-6a4b-4bbd-b191-d63b82a14509@bsbernd.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Mon, 8 Jun 2026 11:35:11 -0700
X-Gm-Features: AVVi8CfJPRBB6R88R8NeQOG9zr14wRLwhjBTQyfuneEOQnOyvfk3KG00nzcOj4k
Message-ID: <CAJnrk1b4S3EUb-FzrvojC2Lp-DOD1GZEpvEKEMKhPpZbf+sqLQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] fuse: end fuse_req on io-uring cancel task work
To: Bernd Schubert <bernd@bsbernd.com>
Cc: miklos@szeredi.hu, fuse-devel@lists.linux.dev, Chris Mason <clm@meta.com>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 8, 2026 at 10:16=E2=80=AFAM Bernd Schubert <bernd@bsbernd.com> =
wrote:
>
>
> On 6/8/26 18:46, Joanne Koong wrote:
> > On Sat, Jun 6, 2026 at 12:41=E2=80=AFAM Bernd Schubert <bernd@bsbernd.c=
om> wrote:
> >>
> >>
> >> I do not think we need 3/3 at all.
> >
> > I think this is needed for the cases where tw.cancel occurs without a
> > subsequent fuse abort, else the application syscall thread is stuck
> > uninterruptibly in D-state in request_wait_answer() for the
> > connection's lifetime. tw.cancel with a fuse abort is the common case,
> > but I think unfortunately we also need to handle the case where this
> > doesn't occur.
>
>
> I see, the initial code was using IO_URING_F_TASK_DEAD and I had wrongly
> assumed that is related to PF_EXITING.
> Well, I think the fix is clear, although I personally do not like the
> exit code dup (or better triple)
> https://lore.kernel.org/r/20260515045541.1171335-4-joannelkoong@gmail.com
>
> In my option fuse_uring_cancel() and canceled fuse_uring_send_in_task()
> should go through fuse_uring_entry_teardown().
>

I don't feel strongly about this. On cancel, the ent becomes useless
since cancel consumes the cmd, so imo it makes sense to just free and
clean up the ent immediately instead of keeping it around until the
fuse connection gets eventually aborted, but I don't think it really
matters. Happy to go with what you prefer.

Thanks,
Joanne

>
> Thanks,
> Bernd
