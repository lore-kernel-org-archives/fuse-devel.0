Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 246AC44AB60
	for <fuse-devel@lists.linux.dev>; Mon, 17 Aug 2026 16:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786983344; cv=pass; b=JMgvF1adyT396SgVv1qufcg9x7fJstnZH1Z01AH2UhiuOEMtQlAzKhJ4uLv5mQhosuuqgXq1ZkqsWE5Kc6MHBN3LoAtnXepeYTKgAWdb29iDrWQSoI7DPUWjSogDnSTzxJhw0Y+mE+XZl8k1/BzVfahxgy92s6F7k+J3Tpq+E9Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786983344; c=relaxed/simple;
	bh=Mkhe5gox6eVsgExwz5Ayb7EcutWJSZ4CdtytZKyOI4E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V3pdKzk4Myyjs7ZCjdXX+n6Wp812DHuIzZtw7v0ccLwBu+A+v8158siErXivtnIktMdh5F1JSY38HuZnSMVZRF4S/WHTyVdlcp8Cy5S6g2JUNDTi8QgufEZSLZmHW/ouywR4nuKHbeSMYFrV7WwYEHPKljpVUsDPYF+AE3cHRm0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=ltFwc3ou; arc=pass smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="ltFwc3ou"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-936d00181abso161137185a.2
        for <fuse-devel@lists.linux.dev>; Mon, 17 Aug 2026 09:15:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786983342; cv=none;
        d=google.com; s=arc-20260327;
        b=GKHW5iVGkD9ET6e9uB0Co4tJtLr5gssqO18VrY71Y+ifQV2GpUAUCNAopXkaRIy5bt
         c/l23Xx3nfeFGko+I3d7n6iLHwb/G/u/2VCQ4ZoBSzmnTgoitS852vdcFCRG7ITxPJwC
         xkdk1yZGC2/2nzW/gEpOjEaOK7CCNtG/ykKrZy1Lf041iI30Cu0YKjuWusOl1q3OjQ6y
         d64gBpFvGpxQ8ODaxx2hYB3A3L0h6wAl6Bi+qdYHLN6lS2Ix2wIAUD/tS+eCjqFlKi80
         OTCfLp2zaTdEpafqZBDndG2VZdkHtnkFbGGPCycBptOGh0EFu+glVxcGS068j8MgSrtD
         Japg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=EnvGXtiyY0vjHDhLAuq73Kig9VT/aUwBwM7cIFN58BY=;
        fh=x2DgWIMpPIBbEGzxEoTL8ujApQ7x58e8Jd+Rn7LXVG8=;
        b=JPRL8iRDmjfo3iqYJI16GTeZtVv/KW38dvriRuIXZGHKoxniB79olaQsoefeLaqTXW
         UP/ROHIzaUKkAdSgd9cDVsP5VZ1TLyZAhcoJ4GVTovsSisiqrtMGLLGhyjeQ3zTXSf80
         2k1qV3wcHaF+SpRXeIb6KgBRX9s+MMJPs+27s3bd01kC0f/n69nEoUJt537BfT0MSb5f
         ExVwzIJR9JoAsuZYPTJJLuMGeW8Mngo1pJheVgoEhWWFqiYHL954HGUO9vVZvn5NwsX9
         fhFi2rtb1l1eX0634yFwGKAlS0qEnJF1NSuqlA07Udi0EoQ2Gq9LqSmOBIJgUMV3hKdz
         aTrQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1786983342; x=1787588142; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EnvGXtiyY0vjHDhLAuq73Kig9VT/aUwBwM7cIFN58BY=;
        b=ltFwc3ouBDrUOyXltGGp9VZPqbMNt5GkoOrISmzVDd+V5HsI+RPhUl2rlfKbZr6xRm
         4gUFiWe23S7XzDQR02f2TdIsn5LrQUxjdtXC/ILuSqtu9H/PjXE6BzG3hIL+xzMPzLeS
         sYQK474FVeosqFNw/rVpnGCpemeUkINE1MEpE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786983342; x=1787588142;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EnvGXtiyY0vjHDhLAuq73Kig9VT/aUwBwM7cIFN58BY=;
        b=Nm5YnrxDodMqr4UROK9c03LikRz+a2S13CG4mcFmX2KcYbe4qQLsZirI/U1f7jzr4C
         o6oXbg18FTpU9ODg/PpqTqyeKoXF1Le6J7hvAQPVwkK/iwQ2ytLHk9Rd4I2+VpPTTeYV
         2o3cI74UWekTW/WqiHHPy11PDlr+DKhYg8RVUXiwWT+1ZdMrpSYPntTYQ1boV7cOuRF4
         XZWSHP+fNPgc0h4z7fB2zPS5oDvxkrKdHUOeHakt2akmStvFK3A0p4MueQEP0KBdDe9M
         wmQLTM6craiWp1GJQenZPeikPG0BDFXf1ryPzEoUJoG3yjym1PySn7r6qR1fE1dp4y5K
         dXLw==
X-Gm-Message-State: AOJu0YwDb40nDcF0NstW/L92wXanu6N9Z3SiyIEGkUdpQE07VZK4TTzA
	YIWNxgdpYvjsvOD4GIHoEGqRZxkT5Z96GPBVpTlPdZqijHrW16nFVnmi5sP3w+4LgxOkCMunDR8
	f77aEyEh/JddSK5x6TrunVgX3feC/kMtGF0SWhpuvCw==
X-Gm-Gg: AR+sD13pweXg3QyjUfiaqZ8xruQSI3CQrd2KiPRzM5uJCgplzkPtALDanbYzFQmFCLx
	wHGN2NQPmX0YmKI2KYUKeuz1NTxhmOzrb+dcfme0lMBo+AgIVmc1hAnytkPY4WBYdg1BXVNrOre
	+XdG/TcZXnaNY5C/q2aKIuQuql4FZ5GnSFeFw4spTs4ILXN2CSfp3/oxOVLa2V9/ypqoCuTfOXW
	a9qoG9aBMF147r6MinpFfk9WlRBLpPFtMGzInfiWbrfrOSCgdedtewZXwwi8lmZOAUkcAbNcR0l
	SPpXc2eMZ1J0JmMSWCY8uvU2/houwesaFcVbpKngmAg65pK7bW0D5MsvwmslfrQLXJUMHQr3bTn
	86E6IVV7mZUsm
X-Received: by 2002:a05:620a:1a08:b0:92a:1b20:fe0c with SMTP id
 af79cd13be357-936d202b16bmr2435875285a.17.1786983341883; Mon, 17 Aug 2026
 09:15:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260812095431.1216919-1-senozhatsky@chromium.org>
In-Reply-To: <20260812095431.1216919-1-senozhatsky@chromium.org>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Mon, 17 Aug 2026 18:15:30 +0200
X-Gm-Features: AcwNN1WN45RnJwIh88m4AzEaKbDRUTbR2beokMHmuVqrkMLHPSOG8Zg4pWohx-U
Message-ID: <CAJfpegvFc=fESH4_mEDcba9BDzUE6u3Oj_+cwU4Hudv8oBjZZA@mail.gmail.com>
Subject: Re: [RFC PATCH] fuse: permit freezing while waiting for request answer
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: fuse-devel@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 12 Aug 2026 at 11:54, Sergey Senozhatsky
<senozhatsky@chromium.org> wrote:
>
> Suspend freezes tasks in random order and doesn't take into
> consideration producer-consumer dependency that may exist
> between tasks.  One example where this can cause issues is:
> fuse server getting frozen ahead of clients, which then get
> stuck waiting for req answers that never come (the server
> is already frozen):
>
>  PM: suspend entry (s2idle)
>  Filesystems sync: 0.018 seconds
>  Freezing user space processes
>  Freezing user space processes failed after 20.001 seconds (1 tasks refusing to freeze, wq_busy=0):
>  task:ThreadPoolForeg state:D stack:0     pid:7873  tgid:7854  ppid:7827   flags:0x00004006
>  Call Trace:
>   <TASK>
>   __schedule+0x554/0x1320
>   ? vprintk_emit+0x2a8/0x320
>   schedule+0x5e/0xd0
>   __fuse_simple_request+0x4c8/0x6d0
>   fuse_do_getattr+0x1e9/0x320
>   fuse_update_get_attr+0x362/0x6a0
>   fuse_file_read_iter+0x13a/0x1b0
>   vfs_read+0x29f/0x2f0
>   ksys_read+0x75/0xf0
>   do_syscall_64+0x70/0xf0
>
> Make all wait-event calls in request_wait_answer() freezer-friendly.
> This uses TASK_FREEZABLE_UNSAFE because often time we freeze holding
> locks (in the upper layers), which triggers debug_locks warning.

If the lock is uncontended, then fine.  If something's waiting on such
a lock, then the freezing will still fail.  This is unfortunate, but
still better than failing the uncontended case as well.  So I don't
see an issue with this.

Thanks,
Miklos
