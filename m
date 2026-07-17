Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ACA8417D92
	for <fuse-devel@lists.linux.dev>; Fri, 17 Jul 2026 13:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784296666; cv=pass; b=S1gwYRoO64D4bymNUN0SFCuIBPSQ+s0xRdU2v0e1xrDAfjPw+LOLgQGDlT5YINqEsc1yeJasF0xGK9bHZs3UNJ9ZZp4A81SBuWCAHVCpf/R+1t9dni+5ia3cnBS4K5OJeiHmqbVL6pxllskkExKdcUth+yKVxPRF0z49cEB5kHM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784296666; c=relaxed/simple;
	bh=NIWlgGZ82N2t72YpcAJ4bZjUa8T2t2a+Dfe1kNiZoh4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xyxsc41gsDVpYjJfij1LqZMbinDZzK2jo3qRITGzBCXyeysWfaei5v5YkXiDRNHvikvN6L2myCbCCfaV/fA/YXi8HWDvglxV3i0vYRu4t2tlsSH/do6QN33yr8gR9oURjr+/p/xR6xsxMU/qIHsP8nn2sxv0LjkVgfzc2DmM1dc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=f8UffKgP; arc=pass smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="f8UffKgP"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-51bfa429aa6so10647111cf.0
        for <fuse-devel@lists.linux.dev>; Fri, 17 Jul 2026 06:57:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784296664; cv=none;
        d=google.com; s=arc-20260327;
        b=HR80KXckcvVZxrpZVoRYJkZ4UI56Xa+6iVGgFDmWL1d74Ggx14eAm2bLska8neLxfE
         /bqQKNTdAmApWrD1kM4rWNw8Sbao+n1LfW+r3ccniASTayIvjGgWvZlLjnPBa8jkLFjS
         1sTOCMPeMtPSoIYafM9vjaGz/y6VOMA7pmBE+SxfdijyWu5yUOp4yN/+Ecz/e+Q3XHzH
         GYflDc9NzoDjaO2+c54Z5Xra7lQppTh0bACQ5ov/h3Hyq031pK/nfQSEh/4TLBTIW0NA
         5bIyEP5R7EzcoztLYYArNMuSt72RI/RCyBo0QEXkUnZaKha4dcPoHJ0fYgPzrL2BZYD5
         8YMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Odov6B43vXk+vo0isqEdE3SnLJCUOIZ/aQObDx6RNE0=;
        fh=wa1t6Z3SNn1iMlHnGOuVKVdkvCfj4iS6xX2+7MOYXo8=;
        b=n4lOenKA6aCKxwSfsKxymlxLcvM2rCmFgN73NEv4df2ux50C3Tuq881E7PDI0sbrWx
         D97s42KxXIhxFXLl13PbXZtfblWKy3t0DCcmrcOS7FZ4k/Q/bHLiRxHNZ2yBmx51DqWW
         pQE5EklkE6JJMIEzkoYOF9Ap4eCMwbagIqq38YRtlXYCJc55UjSZe8L0RlnJU77emms+
         +LozYfppK81YU6et2+PbC62+tIfcIHG5bPC8pb//ocmqhlSGLBBtGzktz4sUxXBNQYdO
         6V9M64e8B8xKZtC8GZUpgoh8xTATs3gEDvbmVRQKj3GosA0SCyKDMfr5vHQ/C50O1G9e
         7TBA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1784296664; x=1784901464; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Odov6B43vXk+vo0isqEdE3SnLJCUOIZ/aQObDx6RNE0=;
        b=f8UffKgP+12dt/8Tu9fFWsA/ETkJx+EudxOxDoA/D8enLvdN6lUXAw+KeJTlDBybmj
         y2TDnm5tuH7T9iVcum+WEmif9N8LGxL1VIwamryn2GCVd57Db6jwkBKDt30+ByCvPbHF
         GlNJfl/hwxNxnPhTpKm8kdaHl7ncgszv43/J8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784296664; x=1784901464;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Odov6B43vXk+vo0isqEdE3SnLJCUOIZ/aQObDx6RNE0=;
        b=mLHVkom+rylAtEon5xvhxa+fmbRHgfrYOM9tUd75qoPYhYz9rCxBmxgmqHbsmWGHDD
         RRmENTICMrcvzm4I+JMr4si+9zDEZuoGZCX54DXJPhWwduLChz2pQ0Q0CvsIfX1eauic
         Whe2clUed25+mrp29x0LsuF+6g82t/DMIYYF+3vNnz5T1QVeppG7860yxlFr2UOnfz3B
         OEYuZgi36JkjALiJZ0PVVK69cElXyUauQAXcTf5Y5BYYT3RcQIBoO9fy1Y/pvD+HLD89
         6YQqlNMDoVh17Qi7fHV0QC6+ANyKm1K5MjNGgC7PyfuCn4fpiOtpAVycS0y3ZL7L69ko
         7aFw==
X-Forwarded-Encrypted: i=1; AHgh+RrZUoAN087DCi9OqNNs57TmwCtwa7Q/K+my4+ATcaBTQLIWPaOycXI1LCuEitDQKhBA9OtzwbYoyQKr@lists.linux.dev
X-Gm-Message-State: AOJu0YzMyif3HobSdzlumKinRt/nsT4YIq2ZCUY8B3GiDiq9/iQ0PZGg
	zMfwNt9+Xd4Q7HjJkfj+bBF0shzsoREQNIzYYhYOu5FiaUY0h+InMU/DZjdnYCYLtw+UzoC6Jkt
	m9OAoQjsUdObTC42yDl9W0GlRr9rHS6IiOQQe1NQY3w==
X-Gm-Gg: AfdE7clWtmfygBYV4Ahd13IF/ONk/FP1DnevfrFJQDdGGjLkYbMHOSAiMS9q7X+bexj
	RD2ZwoyqN4XRHBd95QTLp4egzxHMH1EI0P5oVCZhTMN758LwX+pGto1F2XE7c1rlxOTOZveEcyw
	3RvGuKgtuo0ugOjAye/smPFoO5RgOTcaW+vjYs+GykCVRnb0kUIv4XNBTtqYqGc01ehES/lV6LV
	18gZaV1hpauoikzLiOCMrETPYJpmNohRD37+OjPgMvfBcijNfnatdDOwD6Abjrewre5LGTKI5Xp
	/Ve4ttPs7b1pfeQ=
X-Received: by 2002:a05:622a:428f:b0:51c:7aa7:e0ec with SMTP id
 d75a77b69052e-5212c6edb84mr26552241cf.41.1784296664072; Fri, 17 Jul 2026
 06:57:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260701110052.5309-1-luis@igalia.com> <CAOQ4uxh0Jsa-wqXsTnroJ7W+8hspHEn8ZUrpaxi5YEOZXhCXZQ@mail.gmail.com>
 <87pl16c2z8.fsf@wotan.olymp> <CAOQ4uxg-LcCp5_2OGFo71ejJEPc14uL_D6n04jwy3C2GuoWy7g@mail.gmail.com>
 <87o6gp7ot2.fsf@wotan.olymp>
In-Reply-To: <87o6gp7ot2.fsf@wotan.olymp>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Fri, 17 Jul 2026 15:57:33 +0200
X-Gm-Features: AUfX_mz2LdaCUC1hNOEJYLmikLhfBvHescNtIoMby8GIbWVTc9oKo81tDbVlBvM
Message-ID: <CAJfpegt1ObYX+6+GQ+TcWqnwaYRkzUS_YhVwEN3rLYE0NqQWvw@mail.gmail.com>
Subject: Re: [PATCH] fuse: cache POSIX ACLs when setting them
To: Luis Henriques <luis@igalia.com>
Cc: Amir Goldstein <amir73il@gmail.com>, fuse-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Matt Harvey <mharvey@jumptrading.com>, 
	kernel-dev@igalia.com, Seth Forshee <sforshee@kernel.org>, 
	Christian Brauner <brauner@kernel.org>, Jeff Layton <jlayton@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 2 Jul 2026 at 10:56, Luis Henriques <luis@igalia.com> wrote:

> Yeah, maybe your right, maybe I'm missing something as well and there is a
> good reason for not doing it.
>
> I was going to CC Christian, but I see you did that already :-)
>
> Maybe he remembers the reasons behind this while working on commit
> facd61053cff ("fuse: fixes after adapting to new posix acl api").

It's not that.  Those lines come from the original fuse acl support in
commit 60bcc88ad185 ("fuse: Add posix ACL support").

Maybe the thinking behind that was that the server might modify the
acl when setting it.  Not sure if this can actually happen for network
fs.

In any case it is unlikely to matter in real world cases.  For now
let's just document these quirks.

Thanks,
Miklos
