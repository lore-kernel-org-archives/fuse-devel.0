Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D3447606E
	for <fuse-devel@lists.linux.dev>; Fri, 21 Aug 2026 14:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787322852; cv=pass; b=TKLQD7V5BOVFRcSmmVt4lZudVLC+GlzEdU/X04aTI7ThkOg1UiDUtv+kwgK6I3v1mTb7kZeSmbdvQoh7qkSWbTlf0z9cwnHlGxofjkWAR9T/BNSuzgrX4T6HgaGMj2uzLXZqdLlh7a/2KjPbJPtscnTA7zJpXnQXL9FF7ql5cj8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787322852; c=relaxed/simple;
	bh=CNCPQxq3ZdhaR1ouJWW018pWCfG50OtSYRmamEvhNac=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=deZn8853OHe1fNwrMBL1ultem3911CKyD6jpkEy7VYWlu0w/hGwXo0b6cHh/mbga5P1eCnQIrF2yDi47287x1WPikemyf9aIc4fCOrRLpi4r1jfLJ3indAmEtFfzfY8d7N+Wo1MzuwyMaAKBGmOpG+nG1SbtU9cesb4jEg6a+28=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=OGlAiJDb; arc=pass smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="OGlAiJDb"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-8eeb4508f29so7202586d6.0
        for <fuse-devel@lists.linux.dev>; Fri, 21 Aug 2026 07:34:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787322849; cv=none;
        d=google.com; s=arc-20260327;
        b=XpTX8Q6Iwmr8v3ZIkaNjyxwNi4jdbZuMprMbx0YA8TyXzbjpGNXx3RZrgwF/Kt/aCR
         gkfMG9pe40Mcsb7VpQR+JX7J9EnoHHx33AcFcOwk72Gne3Dxz+ubev+5pAQpJjgBcm9J
         +APdJk1mJlw2PdHDFf2ogXlxpSWRBSICpHEiAZYfhQbMiw8JPytBJ8Ecte8ZVym0bpb3
         LNaoTbPRJfJ8IJc/nr7GS7qJTV10VcKc4HGazlRfhHZjjGI46+Leoa6p5vsYU3T9e8Se
         WkHwrscuIKqBmHZDd1UbUPUHrwy5c009OE8m9T1+JbqFg0PDF9iLq1iGQBfzZ3chxywy
         qNsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=eKQmZSiA4pDne5QBCDZj/WFEVTr73qPsvLTzUWIW8i0=;
        fh=nU5sCk857sAYSETpjAHeWTfO6NGSRXPcnSdZ3hKAKdI=;
        b=Tps5DoPSj02gNxk7OD9YDdsq2gcoEUmJewfClzAClySmy2/TEdlDz53z+JqZk6/y8f
         Rd0KVLtSVTwTaSHa1Mo88hE+9CQTG5QtXwp+5k0QnnDbgMAe7cy8uitCm/ORqWhOPRad
         j2FBYFsKJ1d7qVXGoIuTiSHoeUahSG0p009/N7QZkk1e2mf9ATNPDm4TlCozuXQcQ6Oz
         gro/IE7KaQMyapMNb2ZoUIMjU4x4UpkfQtWQhR/LF4rJD62J0DuusZh1Tx917dW8j+4b
         dclzURihrMjry2fz4Ep+FU9VNZj3XQp1zT0eO1hA+Dpcnm7qFrZfWqRm47ZEMZ/4eQ3U
         zmXQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1787322849; x=1787927649; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eKQmZSiA4pDne5QBCDZj/WFEVTr73qPsvLTzUWIW8i0=;
        b=OGlAiJDbCbxDmzlYBkHpaQ0juq2CKLw4e0xwvVI7ICY/HEEWY/kj5WpWzA6AcohekN
         rPGESB1Qba4zJ9+nI8qA0+Kc3AncW2a1jcqlmmeZyORbVTnfBuGIDYW1yS1P+XmzCmd8
         EEV08UkY/heKsdxeNGDZO2rjOSo3S0i1qYxL4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787322849; x=1787927649;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eKQmZSiA4pDne5QBCDZj/WFEVTr73qPsvLTzUWIW8i0=;
        b=lh/qgh6fhjv1ne+1muqB5QzzPI8Vt7pC9Xa+OgxhXcitEk6jAqr/RJvPEe+M+ePVw8
         MHtvppuk4Kn1l4n2hRQAtDb9KsVS5bz2XWHRELPGPFWMVjJaxu7diFr+R84y+0sNYQ49
         LZGdc1oL9PNaAd5B4TEKKYjMtva9L2KBs0PGdYlG/XSSlo+yStp+9LtvcZ69woiVIVX/
         V4zFX/e/ttgW/klr0xtg5zwq9oM/zPrD/4OLNxS9AorcaAo+pzxyUaao3pAPi2cdjB8a
         crBHg0aSDZa2yDS9yIvMWLLpOaMdkPIivogPG/rIuSDxNsgHuf9L+kHJ3mn6PRzMLpm0
         Hcew==
X-Forwarded-Encrypted: i=1; AHgh+RofX4302d47G4T5sWqzQo6uGfzuTYB8rtdz3TWQ79JQyQmXKgryaD7KGBfReK7lCg3+rGOJA/inm0j6@lists.linux.dev
X-Gm-Message-State: AOJu0YxSnCLU5e0P34fJZxdvxwtFqTw8n82SGBGMP2bS6GNGgDnA99C1
	IfgHZ5wep0r7viYKaBBsIwHD99c5/PA6MHMLdmdG+u6bnSC1I29dYKUezQx9orybWS+M4mADCLK
	RbwvO1Jfv307ICI7+Txj155rHbMlfSUNEBlgduJmtDA==
X-Gm-Gg: AR+sD13NkkEPRsofSb7o4hL+QAk4Ea55h420VjGVLkZqkUv0ahO5EYqBiooOhFFIijj
	y6qn2a5lzLuCpfCdrp5VPnf72y/TFFCHpJdKaihFCHvhTO9qPN58nSXHYvbMAqm0mRYiFHcfGLq
	gi5PWaj2hiWtgS6UtnhC1D1Q5mee4vBME+wsXNMWQXjgnlZXI/n8ZSi+mhrUXB7t9DaHqrOmM0a
	JaSNbBgI//4w8EWOCdXNao5jVRufMnHW0SmHcFOzGf3iwTkD2pw9FOOuddRRuXotnW2tX8JzWEc
	H+nLAXkWJ/UvwmiB5T/c5h+SnBm7JWEYxkXpMJjI1FxQvAoZ0cEU6lkEQcjY7JWRI62KIopTV9g
	u
X-Received: by 2002:ac8:6f13:0:b0:52d:824c:4856 with SMTP id
 d75a77b69052e-52df5a065f7mr63552401cf.31.1787322849295; Fri, 21 Aug 2026
 07:34:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260819023542.561653-1-senozhatsky@chromium.org>
 <CAJfpegu2wOG85R6KSvCwHOuxe2fWczA1KbrFcCZz=ofUch4K=w@mail.gmail.com>
 <20260820084933.GA4036497@noisy.programming.kicks-ass.net>
 <aobDGgivy43cz7xQ@google.com> <20260820091018.GA4120091@noisy.programming.kicks-ass.net>
 <aobGRjc7SE1rwIHu@google.com> <20260820093402.GB1837346@noisy.programming.kicks-ass.net>
 <aobKfyGHkdMcleoc@google.com> <20260820104111.GC1837346@noisy.programming.kicks-ass.net>
 <CAJfpegsSzOqs1zkhB9GZxsT5HT1zXDbHsZNEbA7P7mxe0w2dng@mail.gmail.com> <20260821083000.GF687043@noisy.programming.kicks-ass.net>
In-Reply-To: <20260821083000.GF687043@noisy.programming.kicks-ass.net>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Fri, 21 Aug 2026 16:33:57 +0200
X-Gm-Features: AcwNN1Vpn8g0_rQ_fQGFeXngl74o3K0y7X2OQP-ZffOH44_34qVsJH7mtV5OL48
Message-ID: <CAJfpegvRw0Emd=2hsEeg3AvYaLgRBUbMdo-=eUMa3FRFfnetgA@mail.gmail.com>
Subject: Re: [PATCH v2] fuse: permit freezing while waiting for request answer
To: Peter Zijlstra <peterz@infradead.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, fuse-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 21 Aug 2026 at 10:30, Peter Zijlstra <peterz@infradead.org> wrote:

> That would be adding conditionals to the mutex, something we all pay
> for, always.

It's just one bit (could be stashed  into LSB of ->first_waiter),
Condition is checked before going to sleep, i.e. adds one branch in
the slow path.  Don't think this could be measurable.

> One way would be for each file op to be wrapped like 'link-$op-unlink'
> such that the client (the task doing the file op) gets linked to the
> server (the task responsible for satisfying the request) before it can
> block, and unlinked once its done.

Okay, how do you know which task or tasks are responsible for
satisfying the request?  That's not a generally calculable
information.

sshfs is a simple example: the transport layer process is ssh, but it
is in no way involved in fuse transactions, there's just a pipe
between the two.   How would the kernel know it has to link the ssh
process when the pipe is written to?

There are probably many such examples where this fails.

Thanks,
Miklos
