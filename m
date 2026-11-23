Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795421637;
	b=Q9SscgvbFj8uPiGrwk1QmbYsw01Pz3J7KsPfRLOLU4i5OH8+tzBfZqmawq/gdcP1bs0D
	 rgXelMJLKZQU12n0wXhd/gtZPqE6cROt74TIDW6zsMTdG196TxIb3DtbMtjKXk75VEnsD
	 H3dCJRtYJ811dBE3OBkhGdePj1mATEQA5rLObuP1eImwL8sOVmGePJnTYG4PuD0BLjF1B
	 FdoHBpMj5nHGfkxuaVxYEvbE0APqgv9qoEogBDxsAKwAFwDRBsjmhJFIbmI7gMDRvzYRc
	 OZ3pYInz9LKNYBodOxLq7mJSnIWoTbRWxK0/M4xx8zro9NCWSBIAMPr985kIqJU2Ubw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795421637;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=E/unvZ5PVs3Qjb13st/lyn+8PSXH2T1XWhcQ9dJEZvA=;
	b=bXLvzt0tu4K8AqgmKxnBx7/15ulJHlGFl6tzt3gXqdRdyoZy+p52gjIptY6w3G3rxGf/
	 4TMK4lbYpbzM/bBCHaUap+pEIwPD5Adv5F1rCWXo/fIhgBS6WnzpcJUGqvvrkKd4XUC/S
	 E1OJ3SmMBRczUGT8B/Iqu8CvKasDHyU0vn4Y1jGMMjZdg+ynZUn2xG/sjWKKbhtgrHJ4/
	 Ls6WETCB5bbyYw+UHoosYsJu1++OQq6FfM0jkZ7SsOItVxUiG+IQm9BHI79uaFsb0rObZ
	 UDrfUsEhXTR6iLEXDS3H+DzKQdEOHDRbBW7Itirb7XvpAtRqazRquCNOmNqM2RdVSaA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PdkyGCo1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B59D2606A31E
	for <fuse-devel@lists.linux.dev>; Mon, 23 Nov 2026 08:13:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B59D2606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PdkyGCo1
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b8a52db5f9so3435900a12.3
        for <fuse-devel@lists.linux.dev>; Mon, 23 Nov 2026 00:13:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795421635; cv=none;
        d=google.com; s=arc-20260327;
        b=QwlpFxfK1R7ZM66OY6hSJMfFgc1yNKWKllwhu0CXY83v6vDYlwBacj7PTBOkXyNahT
         tjBqSjdfp57mmV7ZHizQM3vCLxA3eQ22IgGp5PSYdlcq6VDWmkWGdYvFZPpO5w6cQoKG
         uDuOLtrt1hKgjGUebgqSBCkM++8nwcbdt89iK+Lot1EOEkJ05gKIOncnCN/lWLrWkd0m
         HqyNSV4PXXl7FAzY9PBy5BHyBdbxtiqSh4WKXCDsGRGhzZdMZhgPxb3vVEmwgAqAfH2D
         X/eYvdzARMWOsa7832dVe//UeSudN2RekItJZdCZS49BLgm9oX2MoGR3n+fm1v1P8SX0
         5nNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=E/unvZ5PVs3Qjb13st/lyn+8PSXH2T1XWhcQ9dJEZvA=;
        fh=MwYklO+QSn7gxeHmTMxy6lRZcXEXgPiUhnoE5oXF2Yw=;
        b=A0JQbZeexEzRtUK4KYFBz1QjQ66LQkfIXlGBLnqkxvnkXocNrdbjijFpTo425ZsW+8
         UEIZ8xJ0Pb4bW+bJMFwgiEg8QTqr4eASWl7/R40Auu2PtfSszXU9k4puf5MnO/Jzn+il
         SzwlM64VDGl2xoXPKo+sJkCXD5D7SLfW4m2zcbz8hNnHR0ZRNNQwhQmHfcn47ESiXECt
         eOpq10NYBUIgfxhoNrSLdtP27Gm6UG6y+hcbQLxK0YVk8LBNE/+9eERjKZzWOleiJGkD
         QVUYWS3DfMJT1JleCn1zprDC0fwJ/Bqcuhww1ouYgGxPuCU8C5Ynpgee60TDbis2tnye
         qa/w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795421635; x=1796026435; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E/unvZ5PVs3Qjb13st/lyn+8PSXH2T1XWhcQ9dJEZvA=;
        b=PdkyGCo1eqaDMX/wozWBkkZL3/+Sx7kNpo+iIYYsyriH0g7gBBUXq3+l0j77VQJcJR
         UiD6cf1J0Gz6CXFr93IuOXfn8z1fqqaw8vypcNy59hirDhHcf/Lkngr4W+icvgwoXLdm
         X2ZpIAB1/fkmYw5EOzy35Njucc7AkD4yittiT132ZewrFh11JJE7jAS8wFq7g/AU+CRo
         BOB7iBIwhOEHd5wbHdSkWrlyjfOLB+3cMPOyOwTsDxufZnTw9gqKBLNpanC4+pSI8Wq7
         yxrmzOQbeozFV4p5lIrVTqogdjkZJQnNC8LHMHI9Ll32Uy4QRidiTsd7OvmGZS85YqxB
         vOuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795421635; x=1796026435;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=E/unvZ5PVs3Qjb13st/lyn+8PSXH2T1XWhcQ9dJEZvA=;
        b=g2NJ4q/GpNLztvrXnBDZ6mXLpXRgBna8NWI8smG6UAYg7m0Ghu77KkwhR8hA5U3URl
         P1t03IvccHvvqhJqtAUZ2DorQj4R/bT73emqJcG1cIYDO28QnKji+WalU3ckJTlI7wN3
         eJqfBPE5S+3imJeXU2eFjVnE8/ZwwxfBO5V6qolH7ONSzmiKTRKiZ+cp0F07bs01I23E
         ZhUmMDBGBwDqbzeE5jHu7sW0RgSQJR3fKezbC+lHa8mpQ/vCoXLpefPZlTJhtDnjKaVf
         K1EJoqSypcvp4EpnrKH8k9beHDtkv7AZcTrgDhgPfYV7JBc3Sb1bNGi7T+RbWjfc/j45
         KnQg==
X-Forwarded-Encrypted: i=1; AL+hErEVpeHZF/LJdqe3id5eVjYfwnIR8QCHyEHI1dEL7Cw/uY+CQrenbjtOSpHHT0SuOF/z1WkXrYBPktlo@lists.linux.dev
X-Gm-Message-State: APuU4Z//xBPSHvjBnwyosJUtUaJMVHrCG01JQPiN5cbJ8L1pYG3IKy5G
	mZw5T9+A+6rFrHG/KdZ6zF5F+MZtf84faKsXPTfJCujobTBvNOWN1LOw3f9artHXSVpRFnPDJjn
	wyQr0ezgzk/t8T56WJATC2Ew15hjUWqT45l7mnvY=
X-Gm-Gg: AZFdTZcT3Pio7XRPC+EyzG5L9k+MKC28JDhvD1Vk6PY/gmeW3mhKDijKfqN6nGHqVBN
	/w0LTbfsblpVrINubyKKbCEuj6zygzMxWWrRlGiQs9JXjs4jCqeFcsqOiHl2c/c9jsEfUdrDunX
	Vnw8cEYak9Hcc8TcA93XNALLO0EgN6qfnzj2UP2EzOyFLLfNZB1qcWtbhz/P5QI+RzFm8BGqbAj
	aosAkm8pyZqOZILMBqJPZrbkGCuBWzkfzo+WVNihmFwVRA3b/mM5GBQpQiqwH77zARmYK5vODS7
	emsYMdXOgqH3Gg9HT8Y+zcBF0e4r11xwx3IaWHSAWDNLn52QALn4jd/72Tco2rG4+n9S2usBCn8
	pEaUyz3lJl7R5ekqCfzxDE4PdeR+ZEhbTeGswydR7XB3VkRio0VClNhEerHY=
X-Received: by 2002:a05:6402:210d:b0:6ba:668c:ad74 with SMTP id
 4fb4d7f45d1cf-6ba668cb3c9mr4410158a12.25.1795421634816; Mon, 23 Nov 2026
 00:13:54 -0800 (PST)
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261122132916.19066-1-hanwenn@gmail.com>
In-Reply-To: <20261122132916.19066-1-hanwenn@gmail.com>
From: Mitar <mmitar@gmail.com>
Date: Mon, 23 Nov 2026 09:13:41 +0100
X-Gm-Features: Aa3M54rgC9IbJ74E728ovUqRmZMLM3tWBac45j0WtQ5lSHDzlre4CTwJRoXK8qY
Message-ID: <CAKLmikPuNYVzPSUV=gAh8wgCM7Rxk7RWw=P1Y2TX1b5AfABUOw@mail.gmail.com>
Subject: Re: [PATCH 0/3] Subject: [PATCH 0/3] fuse: kill suid/sgid on
 fallocate, copy_file_range and passthrough writes with KILLPRIV_V2
To: Han-Wen Nienhuys <hanwenn@gmail.com>
Cc: amir73il@gmail.com, miklos@szeredi.hu, fuse-devel@lists.linux.dev, 
	linux-fsdevel@lists.linux.dev, bernd@bsbernd.com
Content-Type: text/plain; charset="UTF-8"

Hi!

Thank you for posting this, and thanks to Bernd for the fix. The minor
version bump is what I hoped for: with it a server can tell whether it
may ask for FUSE_HANDLE_KILLPRIV_V2.

One small suggestion for the 7.48 entry in patch 2, which should not
delay the series: as the commit message of patch 1 says, the SETATTR
is sent before every caller of file_remove_privs(), not only before
fallocate, copy_file_range and passthrough writes. It is also a new
kind of SETATTR, with FATTR_KILL_SUIDGID as its only attribute, so a
server which honors the flag only together with FATTR_SIZE (as
virtiofsd does) ignores it. Maybe something like:

- with FUSE_HANDLE_KILLPRIV_V2, send FATTR_KILL_SUIDGID in the
  SETATTR from file_remove_privs(), possibly as its only attribute


Mitar

-- 
https://mitar.tnode.com/
https://noc.social/@mitar
https://bsky.app/profile/mitar.bsky.social
