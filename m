Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DBF53E16A0
	for <fuse-devel@lists.linux.dev>; Sat, 16 May 2026 17:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778952320; cv=pass; b=lXqAE1YRxR4YWEiltRpoWMgYw2P16zMVZGbcqsz4EyPWDoHMLKhg6LR/R4Njq2lJlJoCDKU+sJw8e+wTq2aB+WbumAaJVcC1pTzIldZ0fcY1KvhhhjDDkOmW8VZqxdOpnvRKlkEvfMiArn/Q4dBTD6SoBOWSekT9GX16ecO0MVI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778952320; c=relaxed/simple;
	bh=TRzKnwOpTkmGDP54Ru6Sc1PGEgP5u8OUH3r0WniHtSM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bUKrYHLkqaAjqjr7XMWM+BI+fC7GbuUoBY54cmq6dI/mLY+c7qnKcY8ulhHgDbSha5PCuYg87Wznk97RJWXI6WbixAk7BtrLExi34GoBpFhbRRqxrjJ88U1eQth1erIxiRVgJ8bTgbsdNWoq3DSFydRfjYNH24V1gQ+rOSTFPH0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WljUHX5l; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WljUHX5l"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-bd01481e592so140122666b.2
        for <fuse-devel@lists.linux.dev>; Sat, 16 May 2026 10:25:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778952317; cv=none;
        d=google.com; s=arc-20240605;
        b=MTb5G7F4EF8TyyWMnmBYOV30zWgcJJ+zNTOgsBGLYOMC0aUp5u9UM9ko+0Ge8+uWDz
         dHn/l2xUFPS5NvY9TLlkkT5BhCZjaKz2IAROrZTChltjGojkvxpMf5Kc65eSM0nFNp8L
         wXyYZJa+yIfw8GLK9A68ln5ECipRzeyIagGomcivbYhXi/dAJqnH9AAhJ8pVlek79pNL
         kbe5OKc74V6e+SC7GPm+fWWG7xSossO7JNSegEQNcT7VP2Qck+2gKZZcq1mINT3KCcma
         DRm0BcWMtDSovPHL3MM7N5uDc6zMviMx18S7lvCvtxQCYyBAIIwx/7klbGUiA2mBm89d
         uoJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WuLZKPjKWL/p0iz8VK3C4t61Vhga9NguF4UvQ9dQHtk=;
        fh=P/EF7Ne4JsNwmbYK2j6loPrI4gxbBVQNmxMW9eHvtNw=;
        b=NAJbpZ0U9rvbuOtZ9fgF0uB9t3SqkOVur76q9jkbwLnM4JHo8HLP+2TTiGjjXW0XiX
         o+ZVTLC2jxx5XflunG7rdmv/k9qG+oJlRLz2zpI9cfnbyFqEOdfXz3ppnOZjV8HNyUUP
         FwcJBugJ/oKmtyL3xSfci3gNB4e9ID87gZtMMoy06uxTq6hSxvTv8CYVHFaDrttIJEdU
         w7+vbaUDdrateODW04OpuzNyyD1btPEIdv/ULgshs8MRzwoZvcPjjkuCR8ZTrMgkegrF
         MzP325Tj3dE2L0D/F7z0XUbS38iKvtj9jnLqvXWabRAndGvvYd726sXwG64lJmWE8yGJ
         Ck9Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778952317; x=1779557117; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WuLZKPjKWL/p0iz8VK3C4t61Vhga9NguF4UvQ9dQHtk=;
        b=WljUHX5lucbeJ7WuW6MRSls8Ba6K/t/anZaf0sRpURKKJ0kEqn4duzmMi7mG+hg5pO
         7jDt0iWg4BlADg+qHRbRIa5LomcIpeM1jPS+5VcriDFHwKOtT5fLmmwYrwWtikh0ZFXI
         tVDnlBX2UGf52LSwsoBYe0h7ZksJOAXjju3rDzRmn0w+lx6ESM2pNBWQjlcNjjCgdi+X
         T0X5vovsyNdlrY1yStwzjNlJMB9oFY4buhYf7EQ4FyQwi60te/S7mP1EYWJZKHIGpAr9
         5mTV1DaGm5lBe9VKqw0aGpJBMggNfCgkcTDhnhZENyLCmHBQAYjJ2UUVVGp/6RZJ8134
         K2Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778952317; x=1779557117;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WuLZKPjKWL/p0iz8VK3C4t61Vhga9NguF4UvQ9dQHtk=;
        b=NLbd8XGz9QwF8XjuqfsGiO4ROJpYWlxbldjgImePTT/fsRRsmn0tXdc1ou73wEGwar
         GSJAdHs4/EmNCQ0PKdXfbsj5iqtfg/P2GHbqifQVjbhjV61+2JpgHz3AxFNDpdcJYdxz
         mrkq79cI+MbuUDXWODGvLfkPAlrRpTXY2zleI5r9CgKLfa+rIuWhO/4FMuWZ7Z2yGL3B
         yhrZqAQ5wKQ2mM7vKwYiVwUinyBwS0AHJSBeduPjEuu26ygNSkEk3G8f7punva/K7S8n
         bvZfeqejBXdyUE3fclc1nehGNTQBaDeTtKaCY4lVYIDy3NY2c7ow03AHGj2b9M7yE66m
         0diw==
X-Forwarded-Encrypted: i=1; AFNElJ+Ituby39NTlE9IGhTRz6+WgKA0nSp30Tu1i1wnjDlpXLxyw3Pq4dJBfWfChe9vdUxI9wQLovYog4NZ@lists.linux.dev
X-Gm-Message-State: AOJu0YzZamMiJtYkIn1O8L9eqlpIrKvdtpapbYPMpr0Tb1n384jPtlz+
	sZpoOGOnsRzij6drzCyx3qjYspM325WuWmAsaezyc4TRqqjjvNMiTSqlxMpk2l4Vx8FA/wVhM5P
	fDw4jxCBwIgicotGfNiU0Rj4yYPX6Gfx9qGIE69k=
X-Gm-Gg: Acq92OFdqLxhEbogNDKtBXemiZUDBzcYgJmWlHKgEBfSHsO6uDFiSyrLYTsV0s+LpOQ
	8kzSQih09vtOfcS5H66X+wXBMu2ivQlN+ItQ9TP63AZ+tAxcSGZk6MbadOwXxtp7Y/+PvBZ0inc
	gAGSP7cZvdMCMZh2Th0JQO/4CmLefVcyb5vHcDyQJQo5u2DMKvy9xviNbWNnANaFGomGc792fKi
	ZPBVuAxWKtek6zVp7aTcHP4/q8pQtF2qsFTAewguvaUe5XRK2Bq/YR8zG6OlEq0TYRv/Nyei+ov
	ApjIA8v5p0O/2N+ITmtmddrQ+3ClD6/YSqluwQlTcmQ4WzPuFSHc
X-Received: by 2002:a17:907:72d6:b0:bc7:73f8:9f4c with SMTP id
 a640c23a62f3a-bd5177d53admr451698466b.8.1778952316820; Sat, 16 May 2026
 10:25:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260516004004.1455526-1-joannelkoong@gmail.com> <20260516004004.1455526-13-joannelkoong@gmail.com>
In-Reply-To: <20260516004004.1455526-13-joannelkoong@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Sat, 16 May 2026 19:25:05 +0200
X-Gm-Features: AVHnY4KPI_sg-23dgq26_rEOk4j-ANoCa8Utj1hjtkLFAnKF26aaX5m2wSLyraM
Message-ID: <CAOQ4uxjMPPp-R37yKoOs1kGUdAOmnp3keVWvfuxi1r8jrxAcTA@mail.gmail.com>
Subject: Re: [PATCH v2 12/21] fuse: add struct fuse_entry2_out and helpers for
 extended entry replies
To: Joanne Koong <joannelkoong@gmail.com>
Cc: miklos@szeredi.hu, fuse-devel@lists.linux.dev, 
	linux-unionfs@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 16, 2026 at 2:52=E2=80=AFAM Joanne Koong <joannelkoong@gmail.co=
m> wrote:
>
> Add struct fuse_entry2_out, which is a new extended entry reply struct
> that carries a backing_id and statx attributes. This will be necessary
> for setting fuse passthrough on inodes.
>
> Add helpers that subsequent commits will use to process fuse_entry2_out
> for passthrough support for lookup, revalidate, and create.
> fuse_statx_to_attr() is also moved to earlier in the file to avoid
> forward declaring.
>

I think you had a discussion with Miklos about whether
it makes sense to do a compound response for LOOKUP+STATX.
I don't remember the conclusion, but if this can save us all the
if (use_entry2) { } else {} all over the code, then I think it is worth it.

Can you give me the bottom line from your discussion or was there
no conclusion reached?

If we do that, where do we return backing_id?
Could make use of the reserved[] fields in fuse_statx_out.

I happen to have a test patch at the tip of my fuse-backing-inode-wip
branch:
6e296625eafd6 fuse: support setting backing inode passthrough on getattr

It's not using the statx response, and it was just done for testing,
but in theory,
if a server wants to  change an inode from non-passthrough to
yes-passthrough mid lifetime
doing this on attribute cache expiry may make more sense than on entry
timeout expiry, because backing_id is an attribute of the inode not the den=
try.

Not sure if this is making any sense.

Thanks,
Amir.
