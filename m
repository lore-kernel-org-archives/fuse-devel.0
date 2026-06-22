Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95891390609
	for <fuse-devel@lists.linux.dev>; Mon, 22 Jun 2026 08:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782115587; cv=pass; b=HYIIORnWssDGVRwT5vcTcWOJJXfVtXMkX6U37iQvl8z3xQ4zH1q/hncjlT/3EFJIFzZ94fLNPkoJ05midVKIQn0909UCPzEys/QV8VLFxqOUUx/NZYX9TcRV82m5bOEwhateqKw6ciTdfHHMrKUvafs8Z6CO0P06YD1dfercjF0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782115587; c=relaxed/simple;
	bh=3J8yClsM2QN4XZjvNboSQiZyYwZBLnLD8SO5fc3qxX8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QnH5MowC/lWOFeOrlJuZ5B0l7NSFbsWyt6Qj2F9qIwVMoP3BkbQzyvymPw9H61+vuorkiBYi4+LlY8QpXWwK5yZJOkeLnUYR18ZOk6Ns1wrnGoLTld0aqXaIOvIaEXUgtpP6HNpmAGYF1SVC9rnHZI5C3rOwR+zMoZE3bwy3fQU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JHcLIHpT; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JHcLIHpT"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6977dc206afso2956101a12.1
        for <fuse-devel@lists.linux.dev>; Mon, 22 Jun 2026 01:06:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782115584; cv=none;
        d=google.com; s=arc-20240605;
        b=h821EbCR4zmz6IE7X9tbOIqGQiJoQaHIrLQCLOxm5bjwWXK0ewbApIj/PVnrO51c+g
         Yc4p6TJYmELQiZLFDwOLIEC0D7VhSKhgUtvAv9AI5r6wWD7eKVtYr802FkkI0QH3vYY0
         7VruxD6yECP9LTd2I+8ohYI9X4vm4QNiuegbhNVNFB+JNlR/JauqZiSZksOZg3dGCDtE
         o95FUpZJ/kUfk2OD1A5Q/pdSbwhFTs4vu1W7JtmAoHKzMWCdMtZ4fPZesXg8mzPlEZAw
         n9qbEymy7qcBmWs51O+SjyV1gN97JooKkToULrR8WB1DPbXtxS5+ceLhSSBSI+PT62zg
         iaDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fCEbbEamOKsq8oNa5xjm9f+0HAxFRnG14NABTuykDyQ=;
        fh=T8XogJYJ2ABALib6fWb27rju+qM0eV06xRcYwpceFu0=;
        b=XJPFMM5nQPSr/xYH5D3XHc9WVo7e1+hSn6NtZZaT2AXgCB77tKksvUCVE5g1GcHJFw
         7KUT+Mq07zsfpyByrIUv6oHnJq16qdjbUA8e1w3uMIEzX5fRJCgCaeIzRd4di5A/IOb7
         rZmInhF65lIInoIvH4zakDJXSZ1LdKw971Cv7Qw0k9DzM46X/QpaC5DjsR25nUcZlby3
         Mp/Axk5088fT/BFqr0Ukp4vclIz2AXChpX6QdqdHoaO1+bXjNoaQlErAZ97n6BwGEtrY
         gqZ1YUB/6lqiSJ5G9zInIUUQzWimiUMJJ0Ma8yMyF6d2av6lPMD6oOtpYzUaHrHq+mNj
         /xGA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782115584; x=1782720384; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fCEbbEamOKsq8oNa5xjm9f+0HAxFRnG14NABTuykDyQ=;
        b=JHcLIHpTk13ASL3/snUCtDIlX5cfQVckvKf448bZYv5MdCkGxy/WLjcHuBAZmVeJxK
         7aLjfobceYHgYaW9PWvHpKKVaSj0X5yQ/evnwok3R9FIl21G8g8GPWD70KkQFMLpaQK1
         fDBb/Z8peN/CysjPT/HbRy4Gby/iRjBy5vGg423hTVNll2LLWh72BUVx8o8qYHGZ3pKB
         8qc85tqZB7Q7JRIFNHfemS34y7TNuKbWLs94iazLu1XtfHRmjnOGH3pi1pF5bwkWRmUc
         XBu9CfkZIWtebuEtUVke6iI2xLBr5yVA66WsAiB613ZFmJfpPJJtJYpxtAe+uhWruVOy
         8U1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782115584; x=1782720384;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fCEbbEamOKsq8oNa5xjm9f+0HAxFRnG14NABTuykDyQ=;
        b=NvwXTfXHgS10xzQUeVzlRTZtctTh2ytVb21N5CvjnkOj/0cLA4jykTzQhXzlv0xBYG
         xL56NozIOwhASL2QkGQbP9qrSMLHWL4IwpXPKOnYBA9oNBNHja54ohSxK+8bVHgoSK89
         6rwIbrFnCOmozHIgLfLK7HnLeF/M9fiV0eP6xyJpK3a7AhRozP12XHu1JF2tVf2fnLIQ
         JIIgKbCL92MVn3okgtfntO+4pV+qI5MvQP3ittjtqLKTnWbXTsIg+PycKnOs0HmRhWw+
         bxuX9tovNRErp/V13Vp37KWvWue0TVkMvZB1KxmzHQ6g5B2bIAFEGWF+gCeItliTfaHW
         PC6Q==
X-Forwarded-Encrypted: i=1; AFNElJ/YYUO5TpmZ4OIM3feAsYPWDKp/ymICtd2qbTGE8Gh6r94a4bykteHfrzlyDQrdyG6buRLG94+E4nHY@lists.linux.dev
X-Gm-Message-State: AOJu0Yyfov9uUxPXBUZ2EcJ0FVcYg5eDnZhTd+ttbR2qNbcjtCbKsPHP
	gzkXKjHt1bv5mXVLAHvK1+q1GbYTbynxhwC6B+cxwS853DOebn6vH2tXLdw+d96zL5S8vEZh0hV
	AFk2do1V0nUXO09OCcBckzh47DF8H7zqPZzcS
X-Gm-Gg: AfdE7cnCbLo8HMchkB/+sxWEELUQzg9CMr24rd7gTZXQ3xTcv8CvDz95/hpW7EUeoGM
	zFarQlXBU/mY/oeTWGApcP6zrJRJi6cgn05xRY/4PV2J7T+FjyawxaTcsO9OQwtFh/yhmWhJVrd
	ubpZsDkbkS4RF2/03Z9efJzyvn/ELk9fUbiuYBLMdrcGYlL/PMLNDL9Y7bYnmOmHlLjCKy14hrO
	2YtRW9V3YEFA4VzW89tH4r12tchvq/GqqORyWyzaykZmfwhO5231gcqnCqPCs42NDEVC0EccjEd
	5lxx3wKwfd31W95UMPveZIqRpvZPE5M=
X-Received: by 2002:a05:6402:3809:b0:695:4c21:593b with SMTP id
 4fb4d7f45d1cf-696dde36824mr6375072a12.1.1782115583780; Mon, 22 Jun 2026
 01:06:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260621183157.3490-1-mahad.ibrahim.dev@gmail.com> <CAJfpegvDK7aaMJHmPXxXoJs_MfHe=TBUXWoj=_yA1_m7T8OkwA@mail.gmail.com>
In-Reply-To: <CAJfpegvDK7aaMJHmPXxXoJs_MfHe=TBUXWoj=_yA1_m7T8OkwA@mail.gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 22 Jun 2026 10:06:12 +0200
X-Gm-Features: AVVi8Cef71bfB_mYwYkWvlidn7jmUBAQeGbw8k4Ky4wOo83Hc5aCYKzQVwvG97I
Message-ID: <CAOQ4uxg7JMQb=-tPFxBBQO5dZU-64uP2-pstZDyVSbgG5QKUSA@mail.gmail.com>
Subject: Re: [PATCH] fuse: replace passthrough backing-id IDR with IDA plus hashtable
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>, fuse-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 22, 2026 at 9:25=E2=80=AFAM Miklos Szeredi <miklos@szeredi.hu> =
wrote:
>
> On Sun, 21 Jun 2026 at 20:32, Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>=
 wrote:
>
> > Replace the IDR with an IDA for id allocation and a separate hashtable =
for
> > the id-to-pointer lookup. The IDA needs far less memory per id; the
> > hashtable adds a fixed per-connection cost. The net effect is a space w=
in
> > that grows with the number of live backings, as quantified below.
>
> But why use IDA at all?  A simple cyclic counter should be sufficient.
> Collisions (which should be rare) can be avoided via hash table
> lookup.
>

Also, we were considering widening backing_id to 64bit and allow for
user assigned id's, so if we are dropping IDR/IDA it's a good opportunity
to remove the INT_MAX limit, but we'd still need a 32bit allocator mode
for the legacy backing id.

Thanks,
Amir.
